require 'test_helper'

class AnswerListsControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get answer_lists_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show answer_list with #{login} login" do
			create_and_login_as(login)
			@answer_list = answer_lists(:one)
			get answer_list_url(@answer_list)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get answer_lists_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should show answer_list with #{login} login" do
			create_and_login_as(login)
			@answer_list = answer_lists(:one)
			get answer_list_url(@answer_list)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get answer_lists_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show answer_list without login" do
		@answer_list = answer_lists(:one)
		get answer_list_url(@answer_list)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
