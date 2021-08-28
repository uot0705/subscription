require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      # nickname
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'nicknameが40文字以上では登録できない' do
        @user.nickname = 'あああああああああ、あああああああああ、あああああああああ、あああああああああ、あ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Nickname is too long (maximum is 40 characters)'
      end
      # email
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '登録済のemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'emailは@がないと登録できない' do
        @user.email = 'aaa.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      # password
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが6文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordは半角英数字混合でないと登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordは全角の場合は登録できない' do
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      # check
      it 'checkが空では登録できない' do
        @user.check = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Check can't be blank"
      end
    end
  end
end
