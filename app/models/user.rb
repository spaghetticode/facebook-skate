class User < ActiveRecord::Base
  belongs_to :rank
  has_many :matches
  has_many :closed_matches, :class_name => 'Match', :conditions => {:closed => true}
  has_and_belongs_to_many :items
  
  validates_presence_of :facebook_id
  
  before_save :set_initial_rank
  
  def self.for(facebook_id, facebook_session=nil)
    returning User.find_or_create_by_facebook_id(facebook_id) do |u|
      u.store_session(facebook_session.session_key) if facebook_session
    end
  end
  
  def training
    marker = Date.today.to_s
    return false if trainings == marker*4
    string = trainings.include?(marker) ? trainings : '' 
    returning update_attributes(:trainings => string+marker, :experience => experience+10) do
      update_rank
    end
  end
  
  def buy(item)
    if money >= item.price
      update_attributes(
        :money => money-item.price,
        item.attribute => self[item.attribute]+item.quantity
      )
      items << item
    end
  end
  
  def sell(item)
    if items.include?(item)
      update_attribute(:money, money+item.price/2)
      items.delete(item)
    end
  end
  
  def won_matches
    closed_matches.all(:conditions => {:victory => true})
  end
  
  def lost_matches
    closed_matches.all(:conditions => {:victory => false})
  end
  
  def store_session(session_key)
    if self.session_key != session_key
      update_attribute(:session_key, session_key)
    end
  end
  
  def facebook_session
    @facebook_session ||= 
      returning Facebooker::Session.create do |s|
        s.secure_with!(session_key, facebook_id, 1.hour.from_now)
      end
  end
  
  def available_tricks
    Trick.all(
      :conditions => ['difficulty <= ?', rank.level],
      :order => 'name'
    )
  end
  
  def hometown
    location = Facebooker::User.new(facebook_id).hometown_location
    text_location = "#{location.city} #{location.state}"
    text_location.blank? ? 'undisclosed location' : text_location
  end
  
  def update_rank
    if rank.next_rank && experience >= rank.next_rank.min_experience
      update_attribute(:rank, rank.next_rank)
      profile_text = "<p>Ho raggiunto il livello #{rank.level} a <a href=\"http://apps.facebook.com/playskate/\">SKATE</a>."
      facebook_session.user.profile_fbml = profile_text
    end
  end
  
  def more_experienced?(other)
    self.experience > other.experience
  end
  
  def less_experienced?(other)
    self.experience < other.experience
  end
  
  def cant_do(trick)
    !available_tricks.include?(trick)
  end
  
  def update_experience(results)
    update_attributes(
      :money =>  self.money + results[:money],
      :experience => self.experience + results[:experience]
    )
  end
  
  private
  
  def set_initial_rank
    self.rank ||= Rank.initial_rank 
  end
end
