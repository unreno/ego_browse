require 'test_helper'

class ExpressionsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@expression = expressions(:one)
	end

	test "should get index" do
		get expressions_url
		assert_response :success
	end

	test "should show expression" do
		get expression_url(@expression)
		assert_response :success
	end

end
