require 'test_helper'

class RailsUsersControllerTest < ActionDispatch::IntegrationTest

	%w{admin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get rails_users_url
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create read update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get rails_users_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

end
