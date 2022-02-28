class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
  end

  def comfirm
  end

  def complete
  end

  def create
  end

  def index
   @orders = Order.all
  end

  def show
  end
end
