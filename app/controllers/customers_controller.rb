class CustomersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update]
  
  def index
  	@customer = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
  	if @customer.save
      flash[:success] = "新規作成しました"
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
  	@customer.assign_attributes(customer_params)
  	if @customer.save
  		flash[:success] ="更新しました"
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
	    params.require(:customer).permit(:job_type, :company_name, :tel, :address, :rep, :pic, :call_date, :result, :memo)
	  end

     # Before actions

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "サインインして下さい"
      end
    end

end