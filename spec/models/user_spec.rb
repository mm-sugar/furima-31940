require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、family_name、first_name、family_name_kana、first_name_kana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a1234567'
      @user.password_confirmation = 'a1234567'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")

    end

    it '英文字のみでは登録できないこと' do
      @user.password = 'asdfgh'
      @user.password_confirmation = 'asdfgh'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")

    end

    it '数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it '全角では登録できない' do
      @user.password = 'ＡＢＣ１２３'
      @user.password_confirmation = 'ＡＢＣ１２３'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = 'a123456'
      @user.password_confirmation = 'b123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it '@が含まれていなければ登録できないこと' do
      @user.email = '1234test.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end


    it 'family_nameが半角の場合登録できないこと' do
      @user.family_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end

    it 'first_nameが半角の場合登録できないこと' do
      @user.first_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'family_name_kanaが全角漢字の場合登録できないこと' do
      @user.family_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it 'family_name_kanaが半角カタカナの場合登録できないこと' do
      @user.family_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end

    it 'first_name_kanaが全角漢字の場合登録できないこと' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'first_name_kanaが半角カタカナの場合登録できないこと' do
      @user.first_name_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
  end
end
