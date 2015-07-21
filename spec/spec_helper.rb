RSpec.configure do |config|
end

def login
  @request.env["HTTP_AUTHORIZATION"] = "Basic " + Base64::encode64("oneocean:conserveworld")
end
