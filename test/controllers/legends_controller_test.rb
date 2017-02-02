require 'test_helper'

class LegendsControllerTest < ActionDispatch::IntegrationTest

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get legends_url
			assert_response :success
		end

		test "should show legend with #{login} login" do
			create_and_login_as(login)
			@legend = legends(:one)
			get legend_url(@legend)
			assert_response :success
		end

	end

	test "should get index without login" do
		get legends_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should show legend without login" do
		@legend = legends(:one)
		get legend_url(@legend)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
