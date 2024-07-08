require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '商品購入ができるとき' do
      it 'token、user_id、item_id、post_number、prefecture_id、city、number、phone_numberがあること' do
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'post_numberが空だと購入できない' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end

      it 'post_numberは「3桁-4桁」でないと購入できない' do
        @order_address.post_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post number は「3桁ハイフン4桁」の形式で入力してください')
      end

      it 'post_numberは半角数値でないと購入できない' do
        @order_address.post_number = 'あああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post number は「3桁ハイフン4桁」の形式で入力してください')
      end

      it 'prefecture_idが1だと購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture を選択してください')
      end

      it 'cityが空だと購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'numberが空だと購入できない' do
        @order_address.number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが9桁以内では購入できない' do
        @order_address.phone_number = '080111222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number はハイフンなしの半角数値で入力してください')
      end

      it 'phone_numberが12桁以上では購入できない' do
        @order_address.phone_number = '080111122223'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number はハイフンなしの半角数値で入力してください')
      end

      it 'phone_numberが全角だと購入できない' do
        @order_address.phone_number = 'ああああああああああ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number はハイフンなしの半角数値で入力してください')
      end
    end
  end
end