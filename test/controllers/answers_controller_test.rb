require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get answers_url
			assert_response :success
		end

		test "should show answer with #{login} login" do
			create_and_login_as(login)
			@answer = answers(:one)
			get answer_url(@answer)
			assert_response :success
		end

	end

	test "should get index without login" do
		get answers_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show answer without login" do
		@answer = answers(:one)
		get answer_url(@answer)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
