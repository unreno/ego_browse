require 'test_helper'

class QuestionOptionsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get question_options_url
			assert_response :success
		end

		test "should show question_option with #{login} login" do
			create_and_login_as(login)
			@question_option = question_options(:one)
			get question_option_url(@question_option)
			assert_response :success
		end

	end

	test "should get index without login" do
		get question_options_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show question_option without login" do
		@question_option = question_options(:one)
		get question_option_url(@question_option)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
