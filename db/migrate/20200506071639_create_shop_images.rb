class CreateShopImages < ActiveRecord::Migration[5.2]
  def change
    create_table :shop_images do |t|
      t.text :image
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
