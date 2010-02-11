class AddSponsorsData < ActiveRecord::Migration
  def self.up
    Sponsor.create!(
      :name => "Soda's Skateshop & Tattoo - Sesto Calende VA",
      :url => "http://sodaskateshopandtattoo.com",
      :image_filename => "sodaskateshop.jpg"
    )
    Sponsor.create!(
      :name => "GoodFellas Shop  - streetwear clothing",
      :url => "http://goodshop.it",
      :image_filename => "goodshop.jpg"
    )
  end

  def self.down
    Sponsor.destroy_all
  end
end
