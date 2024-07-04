require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it 'image、title、content、category_id、items_status_id、delivery_price_id、prefecture_id、delivery_date_id、items_priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができないとき' do
      it 'imageが空だと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空だと保存できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空だと保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idが1だと保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category を選択してください')
      end

      it 'items_status_idが1だと保存できない' do
        @item.items_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Items status を選択してください')
      end

      it 'delivery_price_idが1だと保存できない' do
        @item.delivery_price_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery price を選択してください')
      end

      it 'prefecture_idが1だと保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture を選択してください')
      end

      it 'delivery_date_idが1だと保存できない' do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery date を選択してください')
      end

      it 'items_priceが空だと保存できない' do
        @item.items_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items price can't be blank")
      end

      it 'items_priceが299以下だと保存できない' do
        @item.items_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Items price 価格を¥300~¥9,999,999の間で設定してください')
      end

      it 'items_priceが10000000以上だと保存できない' do
        @item.items_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Items price 価格を¥300~¥9,999,999の間で設定してください')
      end

      it 'items_priceが全角だと保存できない' do
        @item.items_price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Items price 価格を¥300~¥9,999,999の間で設定してください')
      end

      it 'userと紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
