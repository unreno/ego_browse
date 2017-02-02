require 'test_helper'

class AlterListsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get alter_lists_url
			assert_response :success
		end

		test "should show alter_list with #{login} login" do
			create_and_login_as(login)
			@alter_list = alter_lists(:one)
			get alter_list_url(@alter_list)
			assert_response :success
		end

	end

	test "should not get index without login" do
		get alter_lists_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should not show alter_list without login" do
		@alter_list = alter_lists(:one)
		get alter_list_url(@alter_list)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
