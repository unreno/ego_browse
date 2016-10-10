require 'test_helper'

class AnswerListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_list = answer_lists(:one)
  end

  test "should get index" do
    get answer_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_answer_list_url
    assert_response :success
  end

  test "should create answer_list" do
    assert_difference('AnswerList.count') do
      post answer_lists_url, params: { answer_list: { active: @answer_list.active, listName: @answer_list.listName, listOptionNames: @answer_list.listOptionNames, studyId: @answer_list.studyId } }
    end

    assert_redirected_to answer_list_url(AnswerList.last)
  end

  test "should show answer_list" do
    get answer_list_url(@answer_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_answer_list_url(@answer_list)
    assert_response :success
  end

  test "should update answer_list" do
    patch answer_list_url(@answer_list), params: { answer_list: { active: @answer_list.active, listName: @answer_list.listName, listOptionNames: @answer_list.listOptionNames, studyId: @answer_list.studyId } }
    assert_redirected_to answer_list_url(@answer_list)
  end

  test "should destroy answer_list" do
    assert_difference('AnswerList.count', -1) do
      delete answer_list_url(@answer_list)
    end

    assert_redirected_to answer_lists_url
  end
end
