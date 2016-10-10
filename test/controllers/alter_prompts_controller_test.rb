require 'test_helper'

class AlterPromptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alter_prompt = alter_prompts(:one)
  end

  test "should get index" do
    get alter_prompts_url
    assert_response :success
  end

  test "should get new" do
    get new_alter_prompt_url
    assert_response :success
  end

  test "should create alter_prompt" do
    assert_difference('AlterPrompt.count') do
      post alter_prompts_url, params: { alter_prompt: { afterAltersEntered: @alter_prompt.afterAltersEntered, display: @alter_prompt.display, studyId: @alter_prompt.studyId } }
    end

    assert_redirected_to alter_prompt_url(AlterPrompt.last)
  end

  test "should show alter_prompt" do
    get alter_prompt_url(@alter_prompt)
    assert_response :success
  end

  test "should get edit" do
    get edit_alter_prompt_url(@alter_prompt)
    assert_response :success
  end

  test "should update alter_prompt" do
    patch alter_prompt_url(@alter_prompt), params: { alter_prompt: { afterAltersEntered: @alter_prompt.afterAltersEntered, display: @alter_prompt.display, studyId: @alter_prompt.studyId } }
    assert_redirected_to alter_prompt_url(@alter_prompt)
  end

  test "should destroy alter_prompt" do
    assert_difference('AlterPrompt.count', -1) do
      delete alter_prompt_url(@alter_prompt)
    end

    assert_redirected_to alter_prompts_url
  end
end
