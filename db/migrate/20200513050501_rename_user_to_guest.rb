class RenameUserToGuest < ActiveRecord::Migration[5.2]
  def change
    rename_table :users, :guests
  end
end
