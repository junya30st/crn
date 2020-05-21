class AddColumnToBlog < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :shop, foreign_key: true
  end
end
