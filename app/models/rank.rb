class Rank < ActiveRecord::Base
  has_many :users
  has_many :tricks
  belongs_to :next_rank, :class_name => 'Rank', :foreign_key => :next_rank_id
  
  validates_presence_of :min_experience, :name, :level
  
  def self.initial_rank
    Rank.first
  end
end
