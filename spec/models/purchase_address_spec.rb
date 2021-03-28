require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '商品の購入' do
    context '商品が購入ができる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
    end

    context '商品の購入ができない時' do
      it 'tokenが空だと保存できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_code が空だと保存できないこと' do
        @purchase.post_code = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeには"-"がないと保存できないこと' do
        @purchase.post_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code Input correctly")
      end

      it 'prefecture_idが空では保存できないこと' do
        @purchase.prefecture_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1では登録できないこと' do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include( "Prefecture can't be blank")
      end

      it 'cityが空では保存ができないこと' do
        @purchase.city = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numが空では保存ができないこと' do
        @purchase.house_num = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House num can't be blank")
      end

      it 'phone_numが空では保存ができないこと' do
        @purchase.phone_num = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numで"-"があると保存ができないこと' do
        @purchase.phone_num = "090-12-1234"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num Input only number")
      end

      it 'phonde_numは11桁以上では保存ができないこと' do
        @purchase.phone_num = "090123456789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num Input only number")
      end
    end
  end
end
