class DecisionsController < ApplicationController
  # GET /decisions
  def index
    @decisions = Decision.all
  end

  # GET /decisions/1
  def show
    @decision = Decision.find(params[:id])
    @datasets = @decision.datasets
    @categories = @decision.categories
  end
end
