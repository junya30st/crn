class AddColumnToShops < ActiveRecord::Migration[5.2]
  def change
    add_reference :shops, :customer, foreign_key: true
  end
end
