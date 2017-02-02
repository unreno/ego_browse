require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get users_url
			assert_response :success
		end

		test "should show user with #{login} login" do
			create_and_login_as(login)
			@user = users(:one)
			get user_url(@user)
			assert_response :success
		end

	end

	test "should get index without login" do
		get users_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show user without login" do
		@user = users(:one)
		get user_url(@user)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
