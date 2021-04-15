require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail,passwordとpassword_confirmation,full_last_nameとfull_first_name,kana_last_nameとkana_first_name,birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が含まれていれば登録できる' do
        @user.email = 'test@email'
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        
      end
      it 'full_last_nameが空では登録できない' do
        @user.full_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full last name can't be blank")
      end
      it 'full_first_nameが空では登録できない' do
        @user.full_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Full first name can't be blank")
      end
      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = "testemail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "aa000"
        @user.password_confirmation = "aa000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字が混合されていないと登録できない' do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
    end
  end
end
