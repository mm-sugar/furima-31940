class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit( :post_code, :prefecture_id, :city, :house_num, :building_name, :phone_num).merge(user_id: current_user.id, item_id: @item.id)
  end
end
