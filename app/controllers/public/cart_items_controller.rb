class Public::CartItemsController < ApplicationController

def create
  @customer = current_customer
  @cart_item = CartItem.new(cart_item_params)
  @items = Item.all
  @cart_item.save
  redirect_to cart_items_path

end

def index

end

def update

end

def destroy
end

def destroy_all
end




private
def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
end

end