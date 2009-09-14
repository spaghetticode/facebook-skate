class AddUsersTrainings < ActiveRecord::Migration
  def self.up
    add_column :users, :trainings, :string, :default => ''
  end

  def self.down
    remove_column :users, :trainings
  end
end
