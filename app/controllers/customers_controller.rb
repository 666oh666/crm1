class CustomersController < ApplicationController
  def index
  	@customer = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(params[:customer])
  	if @customer.save
  		flash.notice = "新規登録しました"
  		redirect_to '/index'
  	else
  		render action: 'new'
  	end
  end
  	

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.assign_attributes(params[:customer])
  	if @customer.save
  		flash.notice ="新規登録しました"
  		redirect_to '/index'
  	else
  		render action: 'edit'
  	end
  end

  def destroy
  	@customer = Customer.find(params[:id])
  	@customer.destroy
  	redirect_to '/index'
  end

	private
	  def customer_params
	    params.require(:customer).permit(:job_type, :company_name, :tel)
	  end
end