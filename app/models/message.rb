class Message < ActiveRecord::Base
  validates_presence_of :image, :body, :category
end
