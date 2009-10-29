class Sponsor < ActiveRecord::Base
  named_scope :ordered, :order => 'name'
  
  def self.random
    all(:order => 'random() limit 1')[0]
  end
  
  def image_path
    "/images/sponsors/#{image_filename}"
  end
end
