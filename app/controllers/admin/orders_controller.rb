class Admin::OrdersController < ApplicationController
def show
@order = Order.find(orders[:id])
end

end
