require 'test_helper'

class InterviewsControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get interviews_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show interview with #{login} login" do
			create_and_login_as(login)
			@interview = interviews(:one)
			get interview_url(@interview)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get interviews_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show interview with #{login} login" do
			create_and_login_as(login)
			@interview = interviews(:one)
			get interview_url(@interview)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should get index without login" do
		get interviews_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show interview without login" do
		@interview = interviews(:one)
		get interview_url(@interview)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
