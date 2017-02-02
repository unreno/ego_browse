require 'test_helper'

class AltersControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get alters_url
			assert_response :success
		end

		test "should show alter with #{login} login" do
			create_and_login_as(login)
			@alter = alters(:one)
			get alter_url(@alter)
			assert_response :success
		end

	end

	test "should get index without login" do
		get alters_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show alter without login" do
		@alter = alters(:one)
		get alter_url(@alter)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
