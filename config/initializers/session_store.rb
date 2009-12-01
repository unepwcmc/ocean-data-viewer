# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_marine_portal_session',
  :secret      => '24949ad28d6e11b8879f45df9c6405cb50bb70d8d29ee1b9633f525d078dd665f5afd37f9092864335e9acebbccc140a4a2823f411e4dcfa1180a85f36da1d4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
