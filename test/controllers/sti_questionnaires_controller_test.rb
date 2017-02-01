require 'test_helper'

class StiQuestionnairesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sti_questionnaire = sti_questionnaires(:one)
  end

  test "should get index" do
    get sti_questionnaires_url
    assert_response :success
  end

  test "should get new" do
    get new_sti_questionnaire_url
    assert_response :success
  end

  test "should create sti_questionnaire" do
    assert_difference('StiQuestionnaire.count') do
      post sti_questionnaires_url, params: { sti_questionnaire: { date_of_visit: @sti_questionnaire.date_of_visit, notest_reason_other: @sti_questionnaire.notest_reason_other, notest_reason_a: @sti_questionnaire.notest_reason_a, notest_reason_b: @sti_questionnaire.notest_reason_b, notest_reason_c: @sti_questionnaire.notest_reason_c, notest_reason_d: @sti_questionnaire.notest_reason_d, notest_reason_e: @sti_questionnaire.notest_reason_e, notest_reason_f: @sti_questionnaire.notest_reason_f, notest_reason_g: @sti_questionnaire.notest_reason_g, notest_reason_h: @sti_questionnaire.notest_reason_h, notest_reason_i: @sti_questionnaire.notest_reason_i, participant_id: @sti_questionnaire.participant_id, staff_person: @sti_questionnaire.staff_person, stipercrisk: @sti_questionnaire.stipercrisk, stistigma: @sti_questionnaire.stistigma, stitest_a: @sti_questionnaire.stitest_a, stitest_b: @sti_questionnaire.stitest_b, stitest_c: @sti_questionnaire.stitest_c, stitest_d: @sti_questionnaire.stitest_d, stitest_e: @sti_questionnaire.stitest_e, stitest_f: @sti_questionnaire.stitest_f, stitest_g: @sti_questionnaire.stitest_g, stitest_h: @sti_questionnaire.stitest_h, stitest_i: @sti_questionnaire.stitest_i, stitest_j: @sti_questionnaire.stitest_j, stitest_ev: @sti_questionnaire.stitest_ev, stitest_future: @sti_questionnaire.stitest_future, stitest_last: @sti_questionnaire.stitest_last, stitest_last_never: @sti_questionnaire.stitest_last_never, stitest_locn: @sti_questionnaire.stitest_locn, stitest_other: @sti_questionnaire.stitest_other, stitest_reason_a: @sti_questionnaire.stitest_reason_a, stitest_reason_b: @sti_questionnaire.stitest_reason_b, stitest_reason_c: @sti_questionnaire.stitest_reason_c, stitest_reason_d: @sti_questionnaire.stitest_reason_d, stitest_reason_e: @sti_questionnaire.stitest_reason_e, stitest_reason_f: @sti_questionnaire.stitest_reason_f, stitest_reason_g: @sti_questionnaire.stitest_reason_g, stitest_reason_h: @sti_questionnaire.stitest_reason_h, stitest_reason_i: @sti_questionnaire.stitest_reason_i, stitest_reason_other: @sti_questionnaire.stitest_reason_other, stitest_rslt: @sti_questionnaire.stitest_rslt } }
    end

    assert_redirected_to sti_questionnaire_url(StiQuestionnaire.last)
  end

  test "should show sti_questionnaire" do
    get sti_questionnaire_url(@sti_questionnaire)
    assert_response :success
  end

  test "should get edit" do
    get edit_sti_questionnaire_url(@sti_questionnaire)
    assert_response :success
  end

  test "should update sti_questionnaire" do
    patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: { date_of_visit: @sti_questionnaire.date_of_visit, notest_reason_other: @sti_questionnaire.notest_reason_other, notest_reason_a: @sti_questionnaire.notest_reason_a, notest_reason_b: @sti_questionnaire.notest_reason_b, notest_reason_c: @sti_questionnaire.notest_reason_c, notest_reason_d: @sti_questionnaire.notest_reason_d, notest_reason_e: @sti_questionnaire.notest_reason_e, notest_reason_f: @sti_questionnaire.notest_reason_f, notest_reason_g: @sti_questionnaire.notest_reason_g, notest_reason_h: @sti_questionnaire.notest_reason_h, notest_reason_i: @sti_questionnaire.notest_reason_i, participant_id: @sti_questionnaire.participant_id, staff_person: @sti_questionnaire.staff_person, stipercrisk: @sti_questionnaire.stipercrisk, stistigma: @sti_questionnaire.stistigma, stitest_a: @sti_questionnaire.stitest_a, stitest_b: @sti_questionnaire.stitest_b, stitest_c: @sti_questionnaire.stitest_c, stitest_d: @sti_questionnaire.stitest_d, stitest_e: @sti_questionnaire.stitest_e, stitest_f: @sti_questionnaire.stitest_f, stitest_g: @sti_questionnaire.stitest_g, stitest_h: @sti_questionnaire.stitest_h, stitest_i: @sti_questionnaire.stitest_i, stitest_j: @sti_questionnaire.stitest_j, stitest_ev: @sti_questionnaire.stitest_ev, stitest_future: @sti_questionnaire.stitest_future, stitest_last: @sti_questionnaire.stitest_last, stitest_last_never: @sti_questionnaire.stitest_last_never, stitest_locn: @sti_questionnaire.stitest_locn, stitest_other: @sti_questionnaire.stitest_other, stitest_reason_a: @sti_questionnaire.stitest_reason_a, stitest_reason_b: @sti_questionnaire.stitest_reason_b, stitest_reason_c: @sti_questionnaire.stitest_reason_c, stitest_reason_d: @sti_questionnaire.stitest_reason_d, stitest_reason_e: @sti_questionnaire.stitest_reason_e, stitest_reason_f: @sti_questionnaire.stitest_reason_f, stitest_reason_g: @sti_questionnaire.stitest_reason_g, stitest_reason_h: @sti_questionnaire.stitest_reason_h, stitest_reason_i: @sti_questionnaire.stitest_reason_i, stitest_reason_other: @sti_questionnaire.stitest_reason_other, stitest_rslt: @sti_questionnaire.stitest_rslt } }
    assert_redirected_to sti_questionnaire_url(@sti_questionnaire)
  end

  test "should destroy sti_questionnaire" do
    assert_difference('StiQuestionnaire.count', -1) do
      delete sti_questionnaire_url(@sti_questionnaire)
    end

    assert_redirected_to sti_questionnaires_url
  end
end