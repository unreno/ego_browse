require 'test_helper'

class AnswersControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get answers_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show answer with #{login} login" do
			create_and_login_as(login)
			@answer = answers(:one)
			get answer_url(@answer)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get answers_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show answer with #{login} login" do
			create_and_login_as(login)
			@answer = answers(:one)
			get answer_url(@answer)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get answers_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show answer without login" do
		@answer = answers(:one)
		get answer_url(@answer)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
