require 'simplecov_test_helper'	#	should be first for some reason

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
	# Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
	fixtures :all

	# Add more helper methods to be used by all tests here...
end

ApplicationController.skip_before_action :require_user

#	Effectively skips the admin requirement.
ApplicationController.send(:define_method,:require_admin){true}

#class ApplicationController
#	def require_admin
#		true
#	end
#end




class ActionDispatch::IntegrationTest

	def create_and_login_as( login='test@here.com' )
		user = RailsUser.create!({
			login: login,
			password: 'Test123!', password_confirmation: 'Test123!' })
#			approved: true, confirmed: true, active: true })
		post rails_user_session_url, params: { rails_user_session: {
			login: login,
			password: 'Test123!'
		} }
	end
	alias :create_and_login :create_and_login_as

	def successfully_create_and_login_as( login='test@here.com' )
		assert_difference('RailsUser.count',1) do
			create_and_login_as( login )
			assert_not_nil flash[:notice]
			assert_redirected_to root_url
			follow_redirect!
		end
	end
	alias :successfully_create_and_login :successfully_create_and_login_as

#	def logout
#		UserSession.find.try(:destroy)
#	end
#
#	def assert_redirected_to_login
#		assert_not_nil flash[:error]
#		assert_redirected_to login_path
#	end
#
#	def assert_redirected_to_logout
#		assert_redirected_to logout_path
#	end

end

require 'mocha/mini_test'
