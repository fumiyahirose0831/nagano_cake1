class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
  end

 def create
  cart_items = current_customer.cart_items.all
# ログインユーザーのカートアイテムをすべて取り出して cart_items に入れます
  @order = current_customer.orders.new(order_params)
# 渡ってきた値を @order に入れます
  if @order.save
# ここに至るまでの間にチェックは済ませていますが、念の為IF文で分岐させています
    cart_items.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      oder_details = OrderDetail.new
      oder_details.item_id = cart.item_id
      oder_details.order_id = @order.id
      oder_details.order_comfirm= cart.comfirm
# 購入が完了したらカート情報は削除するのでこちらに保存します
      order_item.order_price = cart.item.price
# カート情報を削除するので item との紐付けが切れる前に保存します
      order_item.save
    end
    redirect_to 遷移したいページのパス
    cart_items.destroy_all
# ユーザーに関連するカートのデータ(購入したデータ)をすべて削除します(カートを空にする)
  else
    @order = Order.new(order_params)
    render :new
  end
end

  def comfirm
    @order = current_customer.orders.new
  if params[:order][:address_number] == "1"
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

  elsif params[:order][:address_number] == "2"
    @order.postal_code = params[:order][:postal_code] 
    @order.address = params[:order][:address] 
    @order.name = params[:order][:name] 

   else
      render :new
   end
   end
  end

  def complete
  end


  def index
   @orders = Order.all
  end

  def show
  end


private
    def order_params
      params.require(:order).permit(:name, :address, :total_price)
    end
    def address_params
      params.require(:order).permit(:name, :address)
    end
end