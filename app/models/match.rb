class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :contender, :class_name => 'User', :foreign_key => :contender_id
  
  validates_presence_of :user, :contender
end
