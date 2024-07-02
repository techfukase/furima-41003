class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_status
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :delivery_date  
end
