require 'test_helper'

class MatchedAltersControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get matched_alters_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show matched_alter with #{login} login" do
			create_and_login_as(login)
			@matched_alter = matched_alters(:one)
			get matched_alter_url(@matched_alter)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get matched_alters_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show matched_alter with #{login} login" do
			create_and_login_as(login)
			@matched_alter = matched_alters(:one)
			get matched_alter_url(@matched_alter)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get matched_alters_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show matched_alter without login" do
		@matched_alter = matched_alters(:one)
		get matched_alter_url(@matched_alter)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
