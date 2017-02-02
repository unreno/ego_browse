require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get questions_url
			assert_response :success
		end

		test "should show question with #{login} login" do
			create_and_login_as(login)
			@question = questions(:one)
			get question_url(@question)
			assert_response :success
		end

	end

	test "should get index without login" do
		get questions_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show question without login" do
		@question = questions(:one)
		get question_url(@question)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
