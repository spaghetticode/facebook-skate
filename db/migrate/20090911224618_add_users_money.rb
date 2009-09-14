class AddUsersMoney < ActiveRecord::Migration
  def self.up
    add_column :users, :money, :integer, :default => 0
  end

  def self.down
    remove_column :users, :money
  end
end
