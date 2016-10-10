require 'test_helper'

class StudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study = studies(:one)
  end

  test "should get index" do
    get studies_url
    assert_response :success
  end

  test "should get new" do
    get new_study_url
    assert_response :success
  end

  test "should create study" do
    assert_difference('Study.count') do
      post studies_url, params: { study: { active: @study.active, alterPrompt: @study.alterPrompt, closed_date: @study.closed_date, conclusion: @study.conclusion, created_date: @study.created_date, egoIdPrompt: @study.egoIdPrompt, fillAlterList: @study.fillAlterList, footer: @study.footer, hideEgoIdPage: @study.hideEgoIdPage, introduction: @study.introduction, javascript: @study.javascript, maxAlters: @study.maxAlters, minAlters: @study.minAlters, modified: @study.modified, multiSessionEgoId: @study.multiSessionEgoId, name: @study.name, restrictAlters: @study.restrictAlters, status: @study.status, style: @study.style, useAsAlters: @study.useAsAlters, userId: @study.userId, value: @study.value, valueDontKnow: @study.valueDontKnow, valueNotYetAnswered: @study.valueNotYetAnswered, valueRefusal: @study.valueRefusal } }
    end

    assert_redirected_to study_url(Study.last)
  end

  test "should show study" do
    get study_url(@study)
    assert_response :success
  end

  test "should get edit" do
    get edit_study_url(@study)
    assert_response :success
  end

  test "should update study" do
    patch study_url(@study), params: { study: { active: @study.active, alterPrompt: @study.alterPrompt, closed_date: @study.closed_date, conclusion: @study.conclusion, created_date: @study.created_date, egoIdPrompt: @study.egoIdPrompt, fillAlterList: @study.fillAlterList, footer: @study.footer, hideEgoIdPage: @study.hideEgoIdPage, introduction: @study.introduction, javascript: @study.javascript, maxAlters: @study.maxAlters, minAlters: @study.minAlters, modified: @study.modified, multiSessionEgoId: @study.multiSessionEgoId, name: @study.name, restrictAlters: @study.restrictAlters, status: @study.status, style: @study.style, useAsAlters: @study.useAsAlters, userId: @study.userId, value: @study.value, valueDontKnow: @study.valueDontKnow, valueNotYetAnswered: @study.valueNotYetAnswered, valueRefusal: @study.valueRefusal } }
    assert_redirected_to study_url(@study)
  end

  test "should destroy study" do
    assert_difference('Study.count', -1) do
      delete study_url(@study)
    end

    assert_redirected_to studies_url
  end
end
