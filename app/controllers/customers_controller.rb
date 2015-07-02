class CustomersController < ApplicationController
  def index
  	@customer = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	@customer.job_type = params[:customer][:job_type]
  	@customer.company_name = params[:customer][:company_name]
  	@customer.tel = params[:customer][:tel]
  	@customer.save
  	redirect_to '/index'
  end

	private
	  def customer_params
	    params.require(:customer).permit(:job_type, :company_name, :tel)
	  end
end