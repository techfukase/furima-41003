class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_status
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :delivery_date  


  validates :image, :title, :content, :user_id, presence: true
  validates :category_id, :items_status_id, :delivery_price_id, :prefecture_id, :delivery_date_id, numericality: { other_than: 1 }
  validates :items_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }  

end
