class AddUsersExperience < ActiveRecord::Migration
  def self.up
    add_column :users, :experience, :integer, :default => 0
  end

  def self.down
    remove_column :users, :experience
  end
end
