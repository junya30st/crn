class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name,               null: false
      t.text :introduction
      t.text :location,             null: false
      t.time :open_time
      t.time :close_time
      t.text :url
      t.string :tel
      t.text :image
      t.timestamps
    end
  end
end
