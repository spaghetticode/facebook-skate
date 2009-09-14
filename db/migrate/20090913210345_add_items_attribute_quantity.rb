class AddItemsAttributeQuantity < ActiveRecord::Migration
  def self.up
    add_column :items, :quantity, :integer, :default => 0
    add_column :items, :attribute, :string
  end

  def self.down
    remove_column :items, :quantity
    remove_column :items, :attribute
  end
end
