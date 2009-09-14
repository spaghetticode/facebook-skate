class Trick < ActiveRecord::Base
  belongs_to :rank
  
  validates_presence_of :name, :difficulty, :rank
end
