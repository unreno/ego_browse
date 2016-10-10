require 'test_helper'

class LegendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legend = legends(:one)
  end

  test "should get index" do
    get legends_url
    assert_response :success
  end

  test "should show legend" do
    get legend_url(@legend)
    assert_response :success
  end

end
