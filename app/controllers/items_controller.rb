class ItemsController < ApplicationController
  def index
  end

  private
  def item_params
    params.require(:item).permit(:image).merge(user_id: current_iser.id)
  end
end
