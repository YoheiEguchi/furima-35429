require 'rails_helper'

RSpec.describe RecordBuyer, type: :model do

  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_buyer = FactoryBot.build(:record_buyer, user_id: user.id, item_id: item.id)
      sleep 0.1
    end
  
    context '内容に問題がない場合' do
      it '全ての値（post_code, shipping_area_id, city, address, building, tel, user_id, item_id, token）が正しく入力されていれば保存できること' do
        expect(@record_buyer).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @record_buyer.building = ''
        expect(@record_buyer).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @record_buyer.post_code = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeは半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_buyer.post_code = '1234567'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it 'post_codeが全角数字では保存できないこと' do
        @record_buyer.post_code = '１２３-４５６７'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'post_codeが半角英数混合では保存できないこと' do
        @record_buyer.post_code = '123-456a'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'post_codeが半角英語では保存できないこと' do
        @record_buyer.post_code = 'aaa-aaaa'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it 'shipping_area_idが空だと保存できないこと' do
        @record_buyer.shipping_area_id = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'shipping_area_idが1では保存できないこと' do
        @record_buyer.shipping_area_id = 1
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Shipping area can't be blank")
      end

      it 'cityが空だと保存できないこと' do
        @record_buyer.city = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @record_buyer.address = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空だと保存できないこと' do
        @record_buyer.tel = ''
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが全角数字では保存できないこと' do
        @record_buyer.tel = '０９０１２３４５６７８'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが半角英数混合では保存できないこと' do
        @record_buyer.tel = '0901234567a'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが半角英語では保存できないこと' do
        @record_buyer.tel = 'aaaaaaaaaaa'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが半角のハイフンを含んだ形式では保存できないこと' do
        @record_buyer.tel = '090-1234-5678'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが12桁以上では保存できないこと' do
        @record_buyer.tel = '090123456789'
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Tel is too long (maximum is 11 characters)")
      end

      it 'tokenが空だと保存できないこと' do
        @record_buyer.token = nil
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと保存できないこと' do
        @record_buyer.user_id = nil
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと保存できないこと' do
        @record_buyer.item_id = nil
        @record_buyer.valid?
        expect(@record_buyer.errors.full_messages).to include("Item can't be blank")
      end

    end
  end

end
