require 'test_helper'

class MatchedAltersControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get matched_alters_url
			assert_response :success
		end

		test "should show matched_alter with #{login} login" do
			create_and_login_as(login)
			@matched_alter = matched_alters(:one)
			get matched_alter_url(@matched_alter)
			assert_response :success
		end

	end

	test "should get index without login" do
		get matched_alters_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show matched_alter without login" do
		@matched_alter = matched_alters(:one)
		get matched_alter_url(@matched_alter)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
