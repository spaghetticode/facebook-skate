class AddUsersDexterityAndStamina < ActiveRecord::Migration
  def self.up
    add_column :users, :stamina, :integer, :default => 0
    add_column :users, :dexterity, :integer, :default => 0
  end

  def self.down
    remove_column :users, :stamina
    remove_column :users, :dexterity
  end
end
