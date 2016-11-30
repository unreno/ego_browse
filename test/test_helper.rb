ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'authlogic/test_case'

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
	fixtures :all

	# Add more helper methods to be used by all tests here...
end

ApplicationController.skip_before_action :require_user

class ActionDispatch::IntegrationTest	#ActionController::TestCase
	setup :activate_authlogic
end
Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
