class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :title, null: false
      t.text       :content, null: false
      t.integer    :category_id, null: false
      t.integer    :items_status_id, null: false
      t.integer    :delivery_price_id, null: false
      t.integer    :prefecture_id, null: false
      t.integer    :delivery_date_id, null: false
      t.integer    :items_price, null: false
      t.references :user, null: false, foreign_key: true      
      t.timestamps
    end
  end
end
