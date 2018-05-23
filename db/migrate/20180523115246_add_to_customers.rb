class AddToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :approved, :boolean, :default => false, :null => false
  end
end
