class AddColumnsToShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :lunch_price,  :integer
    add_column :shops, :dinner_price, :integer
    add_column :shops, :dinner_open,  :time
    add_column :shops, :dinner_close, :time
    add_column :shops, :lunch_last,   :time
    add_column :shops, :dinner_last,  :time
  end
end
