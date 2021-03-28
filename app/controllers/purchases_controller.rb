class PurchasesController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  before_action :block_item, only: [:index, :create]

  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit( :post_code, :prefecture_id, :city, :house_num, :building_name, :phone_num).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    if @item.purchase.present?
      redirect_to root_path
    end 
  end

  def block_item
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end
