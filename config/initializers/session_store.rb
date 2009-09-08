# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fb_skate_session',
  :secret      => '9a344b196ec5f8faed5276eeddd433119f17209f6fcccae49a33be2af635f698bf91b56ce993b6406623de041db8fcbe3c57f02a1c53601ef1d12ea5db7dc00e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
