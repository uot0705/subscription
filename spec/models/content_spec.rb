require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
  end
describe 'サブスクコンテンツ登録' do

    context '登録できるとき' do
    it '全ての項目の入力が存在すれば登録できること' do
        expect(@content).to be_valid
      end
    end

    context '登録できないとき' do
      # nickname
      it 'nameが空では登録できない' do
         @content.name = ''
         @content.valid?
        expect( @content.errors.full_messages).to include "Name can't be blank"
      end
      it 'nicknameが20文字以上では登録できない' do
         @content.name = 'あああああああああ、あああああああああ、あ'
         @content.valid?
        expect( @content.errors.full_messages).to include "Name is too long (maximum is 20 characters)"
      end
      it '価格が空では登録できない' do
        @content.price = ''
        @content.valid?
        expect(@content.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が¥0では登録できない' do
        @content.price = 0
        @content.valid?
        expect(@content.errors.full_messages).to include "Price must be greater than 0"
      end
      it '価格が¥999,999以上では登録できない' do
        @content.price = 10000000
        @content.valid?
        expect(@content.errors.full_messages).to include "Price must be less than 1000000"
      end
      it '価格は全角数字では登録できない' do
        @content.price = '１０００'
        @content.valid?
        expect(@content.errors.full_messages).to include "Price is not a number"
      end
      it '価格は半角英数混合では登録できないこと' do
        @content.price = "1234abcd"
        @content.valid?
        expect(@content.errors.full_messages).to include "Price is not a number"
      end
      it '価格は半角英語だけでは登録できないこと' do
        @content.price = "aaaa"
        @content.valid?
        expect(@content.errors.full_messages).to include "Price is not a number"
      end
    end
  end

end