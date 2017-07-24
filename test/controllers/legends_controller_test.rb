require 'test_helper'

class LegendsControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get legends_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show legend with #{login} login" do
			create_and_login_as(login)
			@legend = legends(:one)
			get legend_url(@legend)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get legends_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show legend with #{login} login" do
			create_and_login_as(login)
			@legend = legends(:one)
			get legend_url(@legend)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get legends_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show legend without login" do
		@legend = legends(:one)
		get legend_url(@legend)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
