require 'test_helper'

class EligibilityScreeningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eligibility_screening = eligibility_screenings(:one)
  end

  test "should get index" do
    get eligibility_screenings_url
    assert_response :success
  end

  test "should get new" do
    get new_eligibility_screening_url
    assert_response :success
  end

  test "should create eligibility_screening" do
    assert_difference('EligibilityScreening.count') do
      post eligibility_screenings_url, params: { eligibility_screening: { age: @eligibility_screening.age, children: @eligibility_screening.children, date_of_screening: @eligibility_screening.date_of_screening, eligible: @eligibility_screening.eligible, eligible_q_8_15: @eligibility_screening.eligible_q_8_15, how_learned: @eligibility_screening.how_learned, how_learned_other: @eligibility_screening.how_learned_other, injection_drugs: @eligibility_screening.injection_drugs, location_of_screening: @eligibility_screening.location_of_screening, marital: @eligibility_screening.marital, matched_to_ego: @eligibility_screening.matched_to_ego, name_of_screener: @eligibility_screening.name_of_screener, partner_count: @eligibility_screening.partner_count, partner_hiv_positive: @eligibility_screening.partner_hiv_positive, partner_injection_drugs: @eligibility_screening.partner_injection_drugs, partner_man_men: @eligibility_screening.partner_man_men, partner_noninjection_drugs: @eligibility_screening.partner_noninjection_drugs, partner_other_partners: @eligibility_screening.partner_other_partners, partner_traded_sex: @eligibility_screening.partner_traded_sex, race: @eligibility_screening.race, race_other: @eligibility_screening.race_other, reason_for_refusal: @eligibility_screening.reason_for_refusal, reason_for_refusal_other: @eligibility_screening.reason_for_refusal_other, referred_appointment_date: @eligibility_screening.referred_appointment_date, referred_appointment_time: @eligibility_screening.referred_appointment_time, referred_for_interview: @eligibility_screening.referred_for_interview, seen_pcp: @eligibility_screening.seen_pcp, sex: @eligibility_screening.sex, tested_hiv: @eligibility_screening.tested_hiv, tested_hiv_result: @eligibility_screening.tested_hiv_result, time_of_screening: @eligibility_screening.time_of_screening, where_live: @eligibility_screening.where_live, where_live_other: @eligibility_screening.where_live_other, willing_to_refer: @eligibility_screening.willing_to_refer } }
    end

    assert_redirected_to eligibility_screening_url(EligibilityScreening.last)
  end

  test "should show eligibility_screening" do
    get eligibility_screening_url(@eligibility_screening)
    assert_response :success
  end

  test "should get edit" do
    get edit_eligibility_screening_url(@eligibility_screening)
    assert_response :success
  end

  test "should update eligibility_screening" do
    patch eligibility_screening_url(@eligibility_screening), params: { eligibility_screening: { age: @eligibility_screening.age, children: @eligibility_screening.children, date_of_screening: @eligibility_screening.date_of_screening, eligible: @eligibility_screening.eligible, eligible_q_8_15: @eligibility_screening.eligible_q_8_15, how_learned: @eligibility_screening.how_learned, how_learned_other: @eligibility_screening.how_learned_other, injection_drugs: @eligibility_screening.injection_drugs, location_of_screening: @eligibility_screening.location_of_screening, marital: @eligibility_screening.marital, matched_to_ego: @eligibility_screening.matched_to_ego, name_of_screener: @eligibility_screening.name_of_screener, partner_count: @eligibility_screening.partner_count, partner_hiv_positive: @eligibility_screening.partner_hiv_positive, partner_injection_drugs: @eligibility_screening.partner_injection_drugs, partner_man_men: @eligibility_screening.partner_man_men, partner_noninjection_drugs: @eligibility_screening.partner_noninjection_drugs, partner_other_partners: @eligibility_screening.partner_other_partners, partner_traded_sex: @eligibility_screening.partner_traded_sex, race: @eligibility_screening.race, race_other: @eligibility_screening.race_other, reason_for_refusal: @eligibility_screening.reason_for_refusal, reason_for_refusal_other: @eligibility_screening.reason_for_refusal_other, referred_appointment_date: @eligibility_screening.referred_appointment_date, referred_appointment_time: @eligibility_screening.referred_appointment_time, referred_for_interview: @eligibility_screening.referred_for_interview, seen_pcp: @eligibility_screening.seen_pcp, sex: @eligibility_screening.sex, tested_hiv: @eligibility_screening.tested_hiv, tested_hiv_result: @eligibility_screening.tested_hiv_result, time_of_screening: @eligibility_screening.time_of_screening, where_live: @eligibility_screening.where_live, where_live_other: @eligibility_screening.where_live_other, willing_to_refer: @eligibility_screening.willing_to_refer } }
    assert_redirected_to eligibility_screening_url(@eligibility_screening)
  end

  test "should destroy eligibility_screening" do
    assert_difference('EligibilityScreening.count', -1) do
      delete eligibility_screening_url(@eligibility_screening)
    end

    assert_redirected_to eligibility_screenings_url
  end
end
