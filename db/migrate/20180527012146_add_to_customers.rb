class AddToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :second_email, :string
    add_column :customers, :second_phone_number, :string
    add_column :customers, :fax, :string
  end
end
