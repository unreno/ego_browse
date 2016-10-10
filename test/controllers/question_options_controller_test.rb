require 'test_helper'

class QuestionOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_option = question_options(:one)
  end

  test "should get index" do
    get question_options_url
    assert_response :success
  end

  test "should show question_option" do
    get question_option_url(@question_option)
    assert_response :success
  end

end
