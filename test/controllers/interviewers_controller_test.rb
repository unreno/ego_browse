require 'test_helper'

class InterviewersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interviewer = interviewers(:one)
  end

  test "should get index" do
    get interviewers_url
    assert_response :success
  end

  test "should show interviewer" do
    get interviewer_url(@interviewer)
    assert_response :success
  end

end
