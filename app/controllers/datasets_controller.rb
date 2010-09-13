class DatasetsController < ApplicationController
  # GET /datasets
  def index
    @datasets = Dataset.find(:all, :order => "order_number ASC")
    @decisions = Decision.find(:all, :order => "order_number ASC", :conditions => {:parent_id => nil})
  end

  # GET /datasets/1
  def show
    @dataset = Dataset.find(params[:id])
    @customer = Customer.new
  end
end
