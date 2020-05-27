class AddImageToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :image, :text
  end
end
