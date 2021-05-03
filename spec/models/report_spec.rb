require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @report = FactoryBot.build(:report, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe '商品の通報' do
    context '商品を通報できるとき' do
      it 'textを入力すれば通報できる' do
        expect(@report).to be_valid
      end
    end

    context '商品を通報できないとき' do
      it 'textが空では通報できない' do
        @report.text = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐付いていなければ通報できない' do
        @report.user = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ通報できない' do
        @report.item = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
