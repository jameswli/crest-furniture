class CustomersController < ApplicationController
  before_filter :authenticate_user!
  def index
  	@customers = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
  		flash[:success] = "New customer created."
      redirect_to @customer
  	else
  		flash.now[:error] = "Please fix the errors."
  		render :new
  	end
  end

  def show    
    @customer = Customer.find(params[:id])
    @note = Note.new
    @location = @customer.location
  end

  def edit
  	@customer = Customer.find(params[:id])
  end	

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  		redirect_to @customer
  	else 
  		flash.now[:error] = "Please fix the errors."
  		render 'edit'
  	end
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	@customer.destroy

  	redirect_to customers_path
  end
  
  private
	  def customer_params
	  		params.require(:customer).permit(:name, :organization, :email, :telephone, :cellphone, :address_line_1, :address_line_2, :city, :state, :zip_code)
	  end
end
