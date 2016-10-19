require 'test_helper'

class AltersControllerTest < ActionDispatch::IntegrationTest
	setup do
		@alter = alters(:one)
	end

	test "should get index" do
		get alters_url
		assert_response :success
	end

	test "should show alter" do
		get alter_url(@alter)
		assert_response :success
	end

end
