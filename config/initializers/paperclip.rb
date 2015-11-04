settings = Rails.application.secrets.paperclip

Paperclip::Attachment.default_options[:url] = settings['attachment_url']
Paperclip::Attachment.default_options[:path] = File.join(
  ":rails_root/public", settings['attachment_path']
)
