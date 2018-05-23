class AddApprovedToCustomer < ActiveRecord::Migration[5.2]
  def self.up
    add_column :customers, :approved, :boolean, :default => false, :null => false
    add_index  :customers, :approved
  end

  def self.down
    remove_index  :customers, :approved
    remove_column :customers, :approved
  end
end
