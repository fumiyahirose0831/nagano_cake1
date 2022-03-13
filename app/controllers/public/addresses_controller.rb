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
    redirect_to root_path

  end
end

def edit
end



def update

end

def destroy
end

 private
  def address_params
   params.require(:address).permit(:name, :postal_code, :address)
  end


end
