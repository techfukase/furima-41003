class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :items_status
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :delivery_date  

  validates :image, :title, :content,
           presence: true
  validates :category_id, :delivery_price_id, :prefecture_id, :delivery_date_id, 
           numericality: { other_than: 1 message: 'を選択してください' }
  validates :items_price, 
           presence: true, 
           numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: '価格を¥300~¥9,999,999の間で設定してください'  }  

end
