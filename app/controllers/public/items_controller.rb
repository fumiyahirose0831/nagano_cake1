class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @items_count = @items.count

  end

  def show
   @item = Item.find(params[:id])
   @cart_item = CartItem.new
   @customer = current_customer


  end



end
