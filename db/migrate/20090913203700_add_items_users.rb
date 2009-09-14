class AddItemsUsers < ActiveRecord::Migration
  def self.up
    create_table :items_users, :id => false do |t|
      t.integer :item_id, :user_id
    end
  end

  def self.down
    drop_table :items_users
  end
end
