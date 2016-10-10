require 'test_helper'

class LegendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legend = legends(:one)
  end

  test "should get index" do
    get legends_url
    assert_response :success
  end

  test "should get new" do
    get new_legend_url
    assert_response :success
  end

  test "should create legend" do
    assert_difference('Legend.count') do
      post legends_url, params: { legend: { color: @legend.color, label: @legend.label, ordering: @legend.ordering, questionId: @legend.questionId, shape: @legend.shape, size: @legend.size, studyId: @legend.studyId } }
    end

    assert_redirected_to legend_url(Legend.last)
  end

  test "should show legend" do
    get legend_url(@legend)
    assert_response :success
  end

  test "should get edit" do
    get edit_legend_url(@legend)
    assert_response :success
  end

  test "should update legend" do
    patch legend_url(@legend), params: { legend: { color: @legend.color, label: @legend.label, ordering: @legend.ordering, questionId: @legend.questionId, shape: @legend.shape, size: @legend.size, studyId: @legend.studyId } }
    assert_redirected_to legend_url(@legend)
  end

  test "should destroy legend" do
    assert_difference('Legend.count', -1) do
      delete legend_url(@legend)
    end

    assert_redirected_to legends_url
  end
end
