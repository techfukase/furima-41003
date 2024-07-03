class AddItemsPriceToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :items_price, :integer
  end
end
