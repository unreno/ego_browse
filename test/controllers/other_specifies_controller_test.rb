require 'test_helper'

class OtherSpecifiesControllerTest < ActionDispatch::IntegrationTest
	setup do
		@other_specify = other_specifies(:one)
	end

	test "should get index" do
		get other_specifies_url
		assert_response :success
	end

	test "should show other_specify" do
		get other_specify_url(@other_specify)
		assert_response :success
	end

end
