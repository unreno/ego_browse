require 'test_helper'

class StudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study = studies(:one)
  end

  test "should get index" do
    get studies_url
    assert_response :success
  end

  test "should show study" do
    get study_url(@study)
    assert_response :success
  end

end
