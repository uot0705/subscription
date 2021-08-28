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
        expect(@content.errors.full_messages).to include 'TITLEを入力してください'
      end
      it 'nicknameが20文字以上では登録できない' do
        @content.name = 'あああああああああ、あああああああああ、あ'
        @content.valid?
        expect(@content.errors.full_messages).to include 'TITLEは20文字以内で入力してください'
      end
      it '価格が空では登録できない' do
        @content.price = ''
        @content.valid?
        expect(@content.errors.full_messages).to include '金額を入力してください'
      end
      it '価格が¥0では登録できない' do
        @content.price = 0
        @content.valid?
        expect(@content.errors.full_messages).to include '金額は0より大きい値にしてください'
      end
      it '価格が¥999,999以上では登録できない' do
        @content.price = 10_000_000
        @content.valid?
        expect(@content.errors.full_messages).to include '金額は1000000より小さい値にしてください'
      end
      it '価格は全角数字では登録できない' do
        @content.price = '１０００'
        @content.valid?
        expect(@content.errors.full_messages).to include '金額は数値で入力してください'
      end
      it '価格は数字以外では登録できないこと' do
        @content.price = 'aaaa'
        @content.valid?
        expect(@content.errors.full_messages).to include '金額は数値で入力してください'
      end
    end
  end
end
