ActionMailer::Base.delivery_method = A9n.delivery_method.to_sym
ActionMailer::Base.smtp_settings = A9n.smtp_settings
ActionMailer::Base.default_url_options = { host: A9n.app_host }
