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
      redirect_to @dataset.shp_download
    else
      flash[:error] = @customer.errors.collect { |f, e| "<li><b>" + f.humanize + "</b> - " + e + "</li>"}
      redirect_to dataset_path(@dataset, {:customer => @customer.attributes})
    end
  end

end
