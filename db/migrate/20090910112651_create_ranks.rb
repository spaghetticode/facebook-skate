class CreateRanks < ActiveRecord::Migration
  def self.up
    create_table :ranks do |t|
      t.string :name
      t.integer :level
      t.integer :next_rank_id
      t.integer :min_experience

      t.timestamps
    end
    add_column :users, :rank_id, :integer
  end

  def self.down
    drop_table :ranks
    remove_column :users, :rank_id
  end
end
