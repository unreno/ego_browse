require 'test_helper'

class AltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alter = alters(:one)
  end

  test "should get index" do
    get alters_url
    assert_response :success
  end

  test "should get new" do
    get new_alter_url
    assert_response :success
  end

  test "should create alter" do
    assert_difference('Alter.count') do
      post alters_url, params: { alter: { active: @alter.active, alterListId: @alter.alterListId, interviewId: @alter.interviewId, name: @alter.name, ordering: @alter.ordering, studyId: @alter.studyId } }
    end

    assert_redirected_to alter_url(Alter.last)
  end

  test "should show alter" do
    get alter_url(@alter)
    assert_response :success
  end

  test "should get edit" do
    get edit_alter_url(@alter)
    assert_response :success
  end

  test "should update alter" do
    patch alter_url(@alter), params: { alter: { active: @alter.active, alterListId: @alter.alterListId, interviewId: @alter.interviewId, name: @alter.name, ordering: @alter.ordering, studyId: @alter.studyId } }
    assert_redirected_to alter_url(@alter)
  end

  test "should destroy alter" do
    assert_difference('Alter.count', -1) do
      delete alter_url(@alter)
    end

    assert_redirected_to alters_url
  end
end
