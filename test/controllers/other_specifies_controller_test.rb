require 'test_helper'

class OtherSpecifiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_specify = other_specifies(:one)
  end

  test "should get index" do
    get other_specifies_url
    assert_response :success
  end

  test "should get new" do
    get new_other_specify_url
    assert_response :success
  end

  test "should create other_specify" do
    assert_difference('OtherSpecify.count') do
      post other_specifies_url, params: { other_specify: { alterId: @other_specify.alterId, interviewId: @other_specify.interviewId, optionId: @other_specify.optionId, value: @other_specify.value } }
    end

    assert_redirected_to other_specify_url(OtherSpecify.last)
  end

  test "should show other_specify" do
    get other_specify_url(@other_specify)
    assert_response :success
  end

  test "should get edit" do
    get edit_other_specify_url(@other_specify)
    assert_response :success
  end

  test "should update other_specify" do
    patch other_specify_url(@other_specify), params: { other_specify: { alterId: @other_specify.alterId, interviewId: @other_specify.interviewId, optionId: @other_specify.optionId, value: @other_specify.value } }
    assert_redirected_to other_specify_url(@other_specify)
  end

  test "should destroy other_specify" do
    assert_difference('OtherSpecify.count', -1) do
      delete other_specify_url(@other_specify)
    end

    assert_redirected_to other_specifies_url
  end
end
