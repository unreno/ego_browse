require 'test_helper'

class MatchedAltersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @matched_alter = matched_alters(:one)
  end

  test "should get index" do
    get matched_alters_url
    assert_response :success
  end

  test "should show matched_alter" do
    get matched_alter_url(@matched_alter)
    assert_response :success
  end

end
