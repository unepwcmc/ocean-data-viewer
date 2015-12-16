class Admin::AdminController < ApplicationController
  layout 'admin'

  before_filter :verify_access

  def verify_access
    authenticate_or_request_with_http_basic("LOGIN") do |username, password|
      username == Rails.application.secrets.admin["username"] && password == Rails.application.secrets.admin["password"]
    end
  end
end
