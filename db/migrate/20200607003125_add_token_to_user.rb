class AddTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :text
    add_column :users, :token_s, :text
  end
end
