# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

# Although this is not needed for an api-only application, rails4 
# requires secret_key_base or secret_token to be defined, otherwise an 
# error is raised.
# Using secret_token for rails3 compatibility. Change to secret_key_base
# to avoid deprecation warning.
# Can be safely removed in a rails3 api-only application.
ApiExercise::Application.config.secret_token = 'dec943d6c3f1e46a302a50b60c856faba0e1757fb8fec8d601e8eb2e27df334f889302120d7de4540c8a8d0dc6d4b013ef8e6bd0d5d25defa3b70cf93d25c572'
