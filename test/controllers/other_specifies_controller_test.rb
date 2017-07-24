require 'test_helper'

class OtherSpecifiesControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get other_specifies_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show other_specify with #{login} login" do
			create_and_login_as(login)
			@other_specify = other_specifies(:one)
			get other_specify_url(@other_specify)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get other_specifies_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show other_specify with #{login} login" do
			create_and_login_as(login)
			@other_specify = other_specifies(:one)
			get other_specify_url(@other_specify)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get other_specifies_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show other_specify without login" do
		@other_specify = other_specifies(:one)
		get other_specify_url(@other_specify)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
