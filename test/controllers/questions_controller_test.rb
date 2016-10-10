require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end

  test "should get new" do
    get new_question_url
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post questions_url, params: { question: { active: @question.active, allButton: @question.allButton, allOptionString: @question.allOptionString, answerReasonExpressionId: @question.answerReasonExpressionId, askingStyleList: @question.askingStyleList, citation: @question.citation, drails: @question.drails, g: @question.g, g: @question.g, g: @question.g, javascript: @question.javascript, keepOnSamePage: @question.keepOnSamePage, listRangeString: @question.listRangeString, maxCheckableBoxes: @question.maxCheckableBoxes, maxLimitType: @question.maxLimitType, maxLiteral: @question.maxLiteral, maxPrevQues: @question.maxPrevQues, minCheckableBoxes: @question.minCheckableBoxes, minLimitType: @question.minLimitType, minListRange: @question.minListRange, minLiteral: @question.minLiteral, networkEColorQId: @question.networkEColorQId, networkESizeQId: @question.networkESizeQId, networkNColorQId: @question.networkNColorQId, networkNSizeQId: @question.networkNSizeQId, networkParams: @question.networkParams, networkRelationshipExprId: @question.networkRelationshipExprId, noneButton: @question.noneButton, ordering: @question.ordering, otherSpecify: @question.otherSpecify, pageLevelDontKnowButton: @question.pageLevelDontKnowButton, pageLevelRefuseButton: @question.pageLevelRefuseButton, preface: @question.preface, prompt: @question.prompt, rails: @question.rails, refuseButton: @question.refuseButton, scaffoxt: @question.scaffoxt, sistRange: @question.sistRange, studyId: @question.studyId, subjectType: @question.subjectType, symmetric: @question.symmetric, timeUnits: @question.timeUnits, title: @question.title, useAlterLisrailld: @question.useAlterLisrailld, uselfExpression: @question.uselfExpression, wButton: @question.wButton, werType: @question.werType, withListRange: @question.withListRange } }
    end

    assert_redirected_to question_url(Question.last)
  end

  test "should show question" do
    get question_url(@question)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_url(@question)
    assert_response :success
  end

  test "should update question" do
    patch question_url(@question), params: { question: { active: @question.active, allButton: @question.allButton, allOptionString: @question.allOptionString, answerReasonExpressionId: @question.answerReasonExpressionId, askingStyleList: @question.askingStyleList, citation: @question.citation, drails: @question.drails, g: @question.g, g: @question.g, g: @question.g, javascript: @question.javascript, keepOnSamePage: @question.keepOnSamePage, listRangeString: @question.listRangeString, maxCheckableBoxes: @question.maxCheckableBoxes, maxLimitType: @question.maxLimitType, maxLiteral: @question.maxLiteral, maxPrevQues: @question.maxPrevQues, minCheckableBoxes: @question.minCheckableBoxes, minLimitType: @question.minLimitType, minListRange: @question.minListRange, minLiteral: @question.minLiteral, networkEColorQId: @question.networkEColorQId, networkESizeQId: @question.networkESizeQId, networkNColorQId: @question.networkNColorQId, networkNSizeQId: @question.networkNSizeQId, networkParams: @question.networkParams, networkRelationshipExprId: @question.networkRelationshipExprId, noneButton: @question.noneButton, ordering: @question.ordering, otherSpecify: @question.otherSpecify, pageLevelDontKnowButton: @question.pageLevelDontKnowButton, pageLevelRefuseButton: @question.pageLevelRefuseButton, preface: @question.preface, prompt: @question.prompt, rails: @question.rails, refuseButton: @question.refuseButton, scaffoxt: @question.scaffoxt, sistRange: @question.sistRange, studyId: @question.studyId, subjectType: @question.subjectType, symmetric: @question.symmetric, timeUnits: @question.timeUnits, title: @question.title, useAlterLisrailld: @question.useAlterLisrailld, uselfExpression: @question.uselfExpression, wButton: @question.wButton, werType: @question.werType, withListRange: @question.withListRange } }
    assert_redirected_to question_url(@question)
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete question_url(@question)
    end

    assert_redirected_to questions_url
  end
end
