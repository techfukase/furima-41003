class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_number, :prefecture_id, :city, :number, :building, :phone_number, :order_id

  VALID_POST_NUMBER_REGEX = /\A\d{3}-\d{4}\z/

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id

    validates :post_number,
              format: { with: VALID_POST_NUMBER_REGEX, message: 'は「3桁ハイフン4桁」の形式で入力してください' }

    validates :prefecture_id,
              numericality: { other_than: 1, message: 'を選択してください' }

    validates :city
    validates :number

    validates :phone_number,
              format: { with: /\A\d{10,11}\z/, message: 'はハイフンなしの半角数値で入力してください' }
              
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, number: number,
                   building: building, phone_number: phone_number, order_id: order_id)
  end
end