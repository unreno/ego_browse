require 'test_helper'

class OtherSpecifiesControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get other_specifies_url
			assert_response :success
		end

		test "should show other_specify with #{login} login" do
			create_and_login_as(login)
			@other_specify = other_specifies(:one)
			get other_specify_url(@other_specify)
			assert_response :success
		end

	end

	test "should get index without login" do
		get other_specifies_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show other_specify without login" do
		@other_specify = other_specifies(:one)
		get other_specify_url(@other_specify)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
