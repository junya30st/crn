class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :name,         null: false
      t.string :introduction
      t.integer :price,       null: false
      t.timestamps
    end
  end
end
