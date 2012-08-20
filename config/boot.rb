require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Check for required environment variables
raise 'Set your RECURLY_API_KEY environment variable' unless ENV.has_key? 'RECURLY_API_KEY'
raise 'Set your RECURLY_JS_PRIVATE_KEY environment variable' unless ENV.has_key? 'RECURLY_JS_PRIVATE_KEY'