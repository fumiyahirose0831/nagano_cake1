class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

 def create
 end



  def comfirm
   @order = Order.new(order_params)

  if params[:order][:address_number] == "1"
    @order.name = current_customer.name
    @order.address = current_customer.customer_address

  elsif params[:order][:address_number] == "2"
    address_new = current_customer.addresses.new(address_params)
   if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
   else
      render :new
# ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
   end
  else
    redirect_to items_path
  end


  def complete
  end


  def index
   @orders = Order.all
  end

  def show
  end
  end

private
    def order_params
      params.require(:order).permit(:name, :address, :total_price)
    end
    def address_params
      params.require(:order).permit(:name, :address)
    end
end