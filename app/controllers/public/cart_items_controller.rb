class Public::CartItemsController < ApplicationController

def create
   @customer = current_customer
   @cart_item = CartItem.new(cart_item_params)
   @items = Item.all
  # 1. 追加した商品がカート内に存在するかの判別
   @item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    if @item
      @item.update(amount: @item.amount + @cart_item.amount)
    # 存在した場合
    # 2. カート内の個数をフォームから送られた個数分追加す


    # 存在しなかった場合
        # カートモデルにレコードを新規作成する
  else
    @cart_item.save
  end
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
    current_customer.cart_items.destroy_all
    redirect_to items_path
end




private
def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
end

end