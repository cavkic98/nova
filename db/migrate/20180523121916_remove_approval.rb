class RemoveApproval < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :approved
  end
end
