require 'test_helper'

class AlterListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alter_list = alter_lists(:one)
  end

  test "should get index" do
    get alter_lists_url
    assert_response :success
  end

  test "should show alter_list" do
    get alter_list_url(@alter_list)
    assert_response :success
  end

end
