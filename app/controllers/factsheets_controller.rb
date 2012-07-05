class FactsheetsController < ApplicationController
  def index
    @datasets = Dataset.find(:all, :conditions => 'factsheet_file_name IS NOT NULL')
  end

end
