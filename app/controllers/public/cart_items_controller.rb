class Public::CartItemsController < ApplicationController

def create
  @customer = current_customer
  @cart_item = CartItem.new(cart_item_params)
  @items = Item.all
  @cart_item.save
  redirect_to cart_items_path

end

def index
@cart_items = current_customer.cart_items.all
end

def update

end

def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
end

def destroy_all
  current_user.cart_items.destroy_all
  redirect_to items_path
end




private
def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
end

end