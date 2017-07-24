require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get questions_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show question with #{login} login" do
			create_and_login_as(login)
			@question = questions(:one)
			get question_url(@question)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get questions_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show question with #{login} login" do
			create_and_login_as(login)
			@question = questions(:one)
			get question_url(@question)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get questions_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show question without login" do
		@question = questions(:one)
		get question_url(@question)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
