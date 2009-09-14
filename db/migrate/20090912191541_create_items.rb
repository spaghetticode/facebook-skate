class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :rank_id
      t.string :image
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
