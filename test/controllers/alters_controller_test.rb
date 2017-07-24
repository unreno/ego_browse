require 'test_helper'

class AltersControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get alters_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show alter with #{login} login" do
			create_and_login_as(login)
			@alter = alters(:one)
			get alter_url(@alter)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get alters_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show alter with #{login} login" do
			create_and_login_as(login)
			@alter = alters(:one)
			get alter_url(@alter)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get alters_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show alter without login" do
		@alter = alters(:one)
		get alter_url(@alter)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
