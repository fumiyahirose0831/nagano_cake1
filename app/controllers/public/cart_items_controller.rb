class Public::CartItemsController < ApplicationController

def create
   @customer = current_customer
   @cart_item = CartItem.new(cart_item_params)
   @items = Item.all
   @item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if @item
      @item.update(amount: @item.amount + @cart_item.amount)

  else
    @cart_item.save
  end
    redirect_to cart_items_path
end

def index
  @cart_items = current_customer.cart_items.all
  @customer = current_customer
end

def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to request.referer

end

def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
end

def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to request.referer
end




private
def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount, :cart_item)
end

end