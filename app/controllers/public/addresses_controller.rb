class Public::AddressesController < ApplicationController
def index
    @address = Address.new
    @customer = current_customer
    @addresses = Address.all

end

def create
     @address = Address.new(address_params)
     @address.customer_id = current_customer.id
  if @address.save
    redirect_to request.referer
  else
    redirect_to request.referer





  end
end

def edit
   @address = Address.find(params[:id])
end



def update
   address = Address.find(params[:id])
   address.update(address_params)
   redirect_to addresses_path(address)
end

def destroy
   @address = Address.find(params[:id])
   @address.destroy
   redirect_to addresses_path
end

 private
  def address_params
   params.require(:address).permit(:name, :postal_code, :address)
  end


end
