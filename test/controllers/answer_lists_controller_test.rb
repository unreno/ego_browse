require 'test_helper'

class AnswerListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer_list = answer_lists(:one)
  end

  test "should get index" do
    get answer_lists_url
    assert_response :success
  end

  test "should show answer_list" do
    get answer_list_url(@answer_list)
    assert_response :success
  end

end
