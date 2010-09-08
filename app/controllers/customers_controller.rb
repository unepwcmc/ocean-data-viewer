class CustomersController < ApplicationController

  # POST /customers
  def create
    @dataset = Dataset.find(params[:dataset_id])
    @customer = Customer.new(params[:customer])
    @customer.dataset = @dataset
    @customer.licence = @dataset.licence

    if @customer.save
      #Postmaster.deliver_registration(@customer)
      session["dataset_#{@dataset.id}"] = "agreed"      
    else
      flash[:notice] = @customer.errors.collect { |c| puts c}
    end
    redirect_to :back     
  end

end
