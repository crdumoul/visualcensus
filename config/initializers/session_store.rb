# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_visualcensus_session',
  :secret      => '6f662d19b6d3cb593835c3e82045b0de9928a554b23105180719b25017bc9ae54055af18e3bbed5fa84c8c2790d1bbead82d752b74a8f0e45604dc99282c69d6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
