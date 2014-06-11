class FactsheetsController < ApplicationController
  def index
    @datasets = Dataset.where('factsheet_file_name IS NOT NULL')
  end
end
