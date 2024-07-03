class RemoveItemsPriceIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :items_price_id, :integer
  end
end
