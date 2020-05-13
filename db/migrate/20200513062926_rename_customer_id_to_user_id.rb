class RenameCustomerIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :shops, :customer_id, :user_id
  end
end
