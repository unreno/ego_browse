require 'test_helper'

class AlterPromptsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@alter_prompt = alter_prompts(:one)
	end

	test "should get index" do
		get alter_prompts_url
		assert_response :success
	end

	test "should show alter_prompt" do
		get alter_prompt_url(@alter_prompt)
		assert_response :success
	end

end
