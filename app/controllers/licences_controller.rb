class LicencesController < ApplicationController

  # GET /licences/1
  def show
    @licence = Licence.find(params[:id])
  end
end
