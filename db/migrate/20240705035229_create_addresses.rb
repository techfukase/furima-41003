class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :post_number, null: false
      t.integer    :prefecture_id, null: false
      t.string     :city, null: false
      t.string     :number, null: false
      t.string     :building
      t.string     :phone_number, null: false
      t.references :order, null: false
      t.timestamps
    end
  end
end
