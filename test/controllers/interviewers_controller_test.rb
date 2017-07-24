require 'test_helper'

class InterviewersControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get interviewers_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show interviewer with #{login} login" do
			create_and_login_as(login)
			@interviewer = interviewers(:one)
			get interviewer_url(@interviewer)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get interviewers_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show interviewer with #{login} login" do
			create_and_login_as(login)
			@interviewer = interviewers(:one)
			get interviewer_url(@interviewer)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get interviewers_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show interviewer without login" do
		@interviewer = interviewers(:one)
		get interviewer_url(@interviewer)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
