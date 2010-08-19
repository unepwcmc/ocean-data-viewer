class DatasetsController < ApplicationController
  # GET /datasets
  def index
    @datasets = Dataset.all
    @decisions = Decision.all
  end

  # GET /datasets/1
  def show
    @dataset = Dataset.find(params[:id])
    @customer = Customer.new
  end
end
