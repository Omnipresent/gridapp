# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jqgrid_session',
  :secret      => '6239f5feea67776796d27d161c7b8c242696b6f600a2a5e89b6c3055cb5d1443ba93fbb63e8ec3abe16c854e834b6b796daea9dcee0f786cd08c9aa879b4535d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
