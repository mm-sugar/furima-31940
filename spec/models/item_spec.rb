require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品の出品' do
    context '出品ができる場合' do
      it 'image、name、description、category_id、product_status_id、shipping_burden_id、prefecture_id、shipping_days_idとpriceが存在すれば出品できること' do
        expect(@item).to be_valid
      end

      it 'nameが40文字以下なら登録できること' do
        @item.name = '12345678901234567890'
        expect(@item).to be_valid
      end

      it 'descriptionが1000文字以内なら登録できること' do
        @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
        expect(@item).to be_valid
      end

      it 'priceが300円以上9999999円以内なら登録できること' do
        @item.price = 2000
        expect(@item).to be_valid
      end

    end



    context '出品できない場合' do
      it 'imageが空では出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空では出品できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'descriptionが空では出品できないこと' do
        @item.description= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空では出品できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_status_idが空では出品できないこと' do
        @item.product_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end

      it 'shipping_burden_idが空では出品できないこと' do
        @item.shipping_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end

      it 'prefecture_idが空では出品できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include( "Prefecture can't be blank")
      end

      it 'shipping_days_idが空では出品できないこと' do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it 'priceが空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'category_idが1では登録できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'product_status_idが1では登録できないこと' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end

      it 'shipping_burden_idが1では登録できないこと' do
        @item.shipping_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping burden can't be blank")
      end

      it 'prefecture_idが1では登録できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include( "Prefecture can't be blank")
      end

      it 'shipping_days_idが1では登録できないこと' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it 'nameが41文字以上では登録できない' do
        @item.name = '12345678901234567890123456789012345678901'
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end

      it 'descriptionが1000文字以上では登録できないこと' do
        @item.description = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
      end

      it 'priceが300円以下では登録ができないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'price9999999円以上では登録ができないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '半角文字では登録ができないこと' do
        @item.price = 'abcd'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
       end
       
       it '全角文字では登録ができないこと' do
        @item.price = 'ＡＢＣＤ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
       end

       it '半角英数字混合では登録ができないこと' do
        @item.price = 'ab123'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
       end

      it '全角数字では登録ができないこと' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
