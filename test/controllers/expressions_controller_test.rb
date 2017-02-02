require 'test_helper'

class ExpressionsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get expressions_url
			assert_response :success
		end

		test "should show expression with #{login} login" do
			create_and_login_as(login)
			@expression = expressions(:one)
			get expression_url(@expression)
			assert_response :success
		end

	end

	test "should get index without login" do
		get expressions_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show expression without login" do
		@expression = expressions(:one)
		get expression_url(@expression)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
