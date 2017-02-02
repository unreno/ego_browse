require 'test_helper'

class StaticsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should not get index with #{login} login" do
			create_and_login_as(login)
			get statics_url
			assert_response :success
		end

		test "should not get reports with #{login} login" do
			create_and_login_as(login)
			get reports_statics_url
			assert_response :success
		end

	end

	test "should not get index without login" do
		get statics_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should not get reports login" do
		get reports_statics_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
