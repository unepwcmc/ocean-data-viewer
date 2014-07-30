class Admin::AdminController < ApplicationController
  layout 'admin'

  before_filter :verify_access

  def verify_access
    authenticate_or_request_with_http_basic("LOGIN") do |username, password|
      username == "oneocean" && password == "conserveworld"
    end
  end
end
