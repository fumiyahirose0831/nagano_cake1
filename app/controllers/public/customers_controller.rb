class Public::CustomersController < ApplicationController
   def show
    @customer = current_customer
   end
   
   def edit
    @customer = Customer.find(params[:id])
   end
   def update
   end
   def unsubscrube
   end
   def withdraw
   end
end
