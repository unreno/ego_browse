require 'test_helper'

class InterviewersControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get interviewers_url
			assert_response :success
		end

		test "should show interviewer with #{login} login" do
			create_and_login_as(login)
			@interviewer = interviewers(:one)
			get interviewer_url(@interviewer)
			assert_response :success
		end

	end

	test "should get index without login" do
		get interviewers_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show interviewer without login" do
		@interviewer = interviewers(:one)
		get interviewer_url(@interviewer)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
