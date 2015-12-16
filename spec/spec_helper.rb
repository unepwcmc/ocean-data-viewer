RSpec.configure do |config|
end

def login
  credentials = Rails.application.secrets.admin
  @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("#{credentials['username']}:#{credentials['password']}")
end
