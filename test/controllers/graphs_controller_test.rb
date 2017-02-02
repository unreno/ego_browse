require 'test_helper'

class GraphsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get graphs_url
			assert_response :success
		end

		test "should show graph with #{login} login" do
			create_and_login_as(login)
			@graph = graphs(:one)
			get graph_url(@graph)
			assert_response :success
		end

	end

	test "should get index without login" do
		get graphs_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show graph without login" do
		@graph = graphs(:one)
		get graph_url(@graph)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
