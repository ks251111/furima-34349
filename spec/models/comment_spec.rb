require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end

  describe 'コメントの投稿' do
    context 'コメントできる場合' do
      it 'textがあればコメントできる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントできない場合' do
      it 'textが空ではコメントできない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userが紐付いていなければコメントできない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it 'itemが紐付いていなければコメントできない' do
        @comment.item = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
