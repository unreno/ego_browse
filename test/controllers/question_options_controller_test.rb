require 'test_helper'

class QuestionOptionsControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get question_options_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show question_option with #{login} login" do
			create_and_login_as(login)
			@question_option = question_options(:one)
			get question_option_url(@question_option)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get question_options_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show question_option with #{login} login" do
			create_and_login_as(login)
			@question_option = question_options(:one)
			get question_option_url(@question_option)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get question_options_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show question_option without login" do
		@question_option = question_options(:one)
		get question_option_url(@question_option)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
