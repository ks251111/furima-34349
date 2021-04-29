require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  describe '商品購入機能' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @buy_shipping = FactoryBot.build(:buy_shipping, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての内容が正しく入力されていれば購入できる' do
        expect(@buy_shipping).to be_valid
      end
      it 'tokenがあれば購入できる' do
        expect(@buy_shipping).to be_valid
      end
      it 'buildが空でも購入できる' do
        @buy_shipping.build = ''
        expect(@buy_shipping).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it 'postalが空では購入できない' do
        @buy_shipping.postal = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postal can't be blank")
      end
      it 'poetalが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @buy_shipping.postal = '1234567'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Postal is invalid")
      end
      it 'areaを選択していないと購入できない' do
        @buy_shipping.area_id = 1
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Area must be other than 1")
      end
      it 'cityが空では購入できない' do
        @buy_shipping.city = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @buy_shipping.address = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'telが空では購入できない' do
        @buy_shipping.tel = ''
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが9桁以下では購入できない' do
        @buy_shipping.tel = '090123456'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが12桁以上では購入できない' do
        @buy_shipping.tel = '090123456789'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel is invalid")
      end
      it 'userが紐付いていないと購入できない' do
        @buy_shipping.user_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @buy_shipping.item_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @buy_shipping.token = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
