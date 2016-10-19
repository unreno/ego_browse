require 'test_helper'

class StaticsControllerTest < ActionDispatch::IntegrationTest

	test "should get index" do
		get statics_url
		assert_response :success
	end

	test "should get reports" do
		get reports_statics_url
		assert_response :success
	end

end
