class CreateTricks < ActiveRecord::Migration
  def self.up
    create_table :tricks do |t|
      t.string :name
      t.integer :rank_id
      t.integer :difficulty

      t.timestamps
    end
  end

  def self.down
    drop_table :tricks
  end
end
