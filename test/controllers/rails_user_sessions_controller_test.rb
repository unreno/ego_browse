require 'test_helper'

class RailsUserSessionsControllerTest < ActionDispatch::IntegrationTest

	test "should get new user session if not logged in" do
		get new_rails_user_session_url
		assert_response :success
	end

	test "should not get new user session if logged in" do
		successfully_create_and_login
		get new_rails_user_session_url
		assert_redirected_to root_url
		assert_not_nil flash[:notice]
	end

	test "should create new user session if not logged in" do
		successfully_create_and_login
	end

	test "should not create new user session if logged in and save fails" do
		RailsUserSession.any_instance.stubs(:save).returns(false)
		create_and_login
		assert_nil flash[:notice]
		assert_response :success
		assert_template :new
	end

	test "should not create new user session if logged in" do
		create_and_login
		post rails_user_session_url, params: { rails_user_session: {
			login: 'test@here.com',
			password: 'Test123!'
		} }
		assert_redirected_to root_url
		assert_not_nil flash[:notice]
	end

	test "should destroy current user session if logged in" do
		successfully_create_and_login

		delete rails_user_session_url
		assert_not_nil flash[:notice]
		assert_redirected_to new_rails_user_session_url	#root_url
	end

	test "should not destroy current user session if not logged in" do
		delete rails_user_session_url
		assert_not_nil flash[:warn]
		assert_redirected_to new_rails_user_session_url
	end

end
