require 'test_helper'

class AlterListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alter_list = alter_lists(:one)
  end

  test "should get index" do
    get alter_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_alter_list_url
    assert_response :success
  end

  test "should create alter_list" do
    assert_difference('AlterList.count') do
      post alter_lists_url, params: { alter_list: { email: @alter_list.email, interviewerId: @alter_list.interviewerId, name: @alter_list.name, ordering: @alter_list.ordering, studyId: @alter_list.studyId } }
    end

    assert_redirected_to alter_list_url(AlterList.last)
  end

  test "should show alter_list" do
    get alter_list_url(@alter_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_alter_list_url(@alter_list)
    assert_response :success
  end

  test "should update alter_list" do
    patch alter_list_url(@alter_list), params: { alter_list: { email: @alter_list.email, interviewerId: @alter_list.interviewerId, name: @alter_list.name, ordering: @alter_list.ordering, studyId: @alter_list.studyId } }
    assert_redirected_to alter_list_url(@alter_list)
  end

  test "should destroy alter_list" do
    assert_difference('AlterList.count', -1) do
      delete alter_list_url(@alter_list)
    end

    assert_redirected_to alter_lists_url
  end
end
