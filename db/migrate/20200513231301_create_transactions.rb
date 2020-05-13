class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name,         null: false
      t.integer :price,       null: false
      t.text :introduction
      t.date :period
      t.references :user,     foreign_key: true
      t.references :product,  foreign_key: true

      t.timestamps
    end
  end
end
