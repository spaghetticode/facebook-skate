class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :caption
      t.text :message
      t.string :image
      t.text :executable

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
