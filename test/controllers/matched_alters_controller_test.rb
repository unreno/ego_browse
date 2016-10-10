require 'test_helper'

class MatchedAltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matched_alter = matched_alters(:one)
  end

  test "should get index" do
    get matched_alters_url
    assert_response :success
  end

  test "should get new" do
    get new_matched_alter_url
    assert_response :success
  end

  test "should create matched_alter" do
    assert_difference('MatchedAlter.count') do
      post matched_alters_url, params: { matched_alter: { alterId1: @matched_alter.alterId1, alterId2: @matched_alter.alterId2, matchedName: @matched_alter.matchedName, studyId: @matched_alter.studyId } }
    end

    assert_redirected_to matched_alter_url(MatchedAlter.last)
  end

  test "should show matched_alter" do
    get matched_alter_url(@matched_alter)
    assert_response :success
  end

  test "should get edit" do
    get edit_matched_alter_url(@matched_alter)
    assert_response :success
  end

  test "should update matched_alter" do
    patch matched_alter_url(@matched_alter), params: { matched_alter: { alterId1: @matched_alter.alterId1, alterId2: @matched_alter.alterId2, matchedName: @matched_alter.matchedName, studyId: @matched_alter.studyId } }
    assert_redirected_to matched_alter_url(@matched_alter)
  end

  test "should destroy matched_alter" do
    assert_difference('MatchedAlter.count', -1) do
      delete matched_alter_url(@matched_alter)
    end

    assert_redirected_to matched_alters_url
  end
end
