class Postmaster < ActionMailer::Base
  def registration(user)
  recipients "One Oceans <OneOcean@unep-wcmc.org>"
  from       "One Oceans Data Portal"
  bcc        ["Simon <si@tinypla.net>"]
  subject    "New Registration"
  sent_on    Time.now
  body       :user => user
  end

end
