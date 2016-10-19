require 'test_helper'

class GraphsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@graph = graphs(:one)
	end

	test "should get index" do
		get graphs_url
		assert_response :success
	end

	test "should show graph" do
		get graph_url(@graph)
		assert_response :success
	end

end
