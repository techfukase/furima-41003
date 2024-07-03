class CreateItemsStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :items_statuses do |t|

      t.timestamps
    end
  end
end
