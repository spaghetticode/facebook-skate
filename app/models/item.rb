class Item < ActiveRecord::Base
  belongs_to :rank
  has_and_belongs_to_many :users
  
  validates_presence_of :name, :description, :image, :rank
  validates_numericality_of :price
  
  def translated_attribute
    case attribute
    when 'stamina'
      'energia'
    when 'dexterity'
      'destrezza'
    when 'experience'
      'esperienza'
    end
  end
end
