class ChangeDatatypedateToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :limit, :integer
  end
end
