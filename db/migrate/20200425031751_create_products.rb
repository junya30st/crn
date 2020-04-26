class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,       null:false
      t.text :introduction, null:false
      t.date :limit
      t.integer :price,     null: false
      t.references :shop,   foreign_key: true
      t.timestamps
    end
  end
end
