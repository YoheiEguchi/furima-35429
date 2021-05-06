require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
  
    it '全ての値（nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birth）が存在すれば登録ができること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録ができないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end


    it 'emailが空では登録ができないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@がなければ登録ができないこと' do
      @user.email = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録ができないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'aaa000'
      @user.password_confirmation = 'aaa000'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it "passwordは英数字混合でないと登録できない" do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordは英字のみでは登録できない" do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
      end
  

    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation ='1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録ができないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録ができないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録ができないこと' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録ができないこと' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

      it "last_nameは数字や半角では登録できない" do
      @user.last_name = "kana1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "first_nameは数字や半角では登録できない" do
      @user.first_name = "kana1"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "last_name_kanaは漢字やひらがなでは登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "first_name_kanaは漢字やひらがなでは登録できない" do
      @user.first_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it "birthが空では登録ができないこと" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

  end
end