class AddColumnToMenu < ActiveRecord::Migration[5.2]
  def change
    add_reference :menus, :shop, foreign_key: true
  end
end
