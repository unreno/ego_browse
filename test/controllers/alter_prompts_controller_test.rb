require 'test_helper'

class AlterPromptsControllerTest < ActionDispatch::IntegrationTest

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get alter_prompts_url
			assert_nil flash[:warn]
			assert_response :success
		end

		test "should show alter_prompt with #{login} login" do
			create_and_login_as(login)
			@alter_prompt = alter_prompts(:one)
			get alter_prompt_url(@alter_prompt)
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get alter_prompts_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

		test "should NOT show alter_prompt with #{login} login" do
			create_and_login_as(login)
			@alter_prompt = alter_prompts(:one)
			get alter_prompt_url(@alter_prompt)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	test "should NOT get index without login" do
		get alter_prompts_url
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

	test "should NOT show alter_prompt without login" do
		@alter_prompt = alter_prompts(:one)
		get alter_prompt_url(@alter_prompt)
		assert_redirected_to new_rails_user_session_url
		assert_not_nil flash[:warn]
	end

end
