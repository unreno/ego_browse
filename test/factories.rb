FactoryBot.define do

#	factory :age_group do
#		sequence(:name) { |n| "Name #{n}" }
#	end

	factory :alter_referral do
#  alter_referral_sheet: one
#  plan_to_refer: false
#  name_cell: MyString
#  date_of_alter_interview: 2016-12-07
#  alter_id: MyString
#  date_ego_notified: 2016-12-07
#  date_ego_paid: 2016-12-07
	end

	factory :alter_referral_sheet do
		data_entry_name ""
#  ego_id: MyString
	end

	factory :contact_information do
		data_entry_name ""
#  first_name: MyString
#  middle_name: MyString
#  last_name: MyString
#  alternate_names: MyString
#  dob: 2016-11-09
#  primary_phone_number: MyString
#  primary_phone_type: abcde
#  primary_phone_message: X
#  primary_phone_text: X
#  secondary_phone_number: MyString
#  secondary_phone_type: abcde
#  secondary_phone_message: X
#  secondary_phone_text: X
#  tertiary_phone_number: MyString
#  tertiary_phone_type: abcde
#  tertiary_phone_message: X
#  tertiary_phone_text: X
#  primary_address: MyString
#  primary_city: MyString
#  primary_state: XX
#  primary_zip: MyString
#  secondary_address: MyString
#  secondary_city: MyString
#  secondary_state: XX
#  secondary_zip: MyString
#  ok_to_mail_negative_test_result: X
#  email: MyString
#  other_person_relationship: MyString
#  other_person_phone: MyString
#  other_person_ok_to_pass_message: X
#  referral_source: MyString
#  height: MyString
#  build: MyString
#  age: 1
#  race: MyString
#  eye_color: MyString
#  hair: MyString
#  other_identifying_marks: MyString
	end

	factory :eligibility_screening do
		data_entry_name ""
#  how_learned: yyyyy
#  how_learned_other: MyString
#  age: 1
#  gender: 1
#  race: 1
#  race_other: MyString
#  children: 1
#  seen_pcp: 1
#  marital: MyString
#  tested_hiv: 1
#  tested_hiv_result: 1
#  partner_count: 1
#  injection_drugs: 1
#  partner_injection_drugs: 1
#  partner_noninjection_drugs: 1
#  partner_hiv_positive: 1
#  partner_other_partners: 1
#  partner_traded_sex: 1
#  partner_man_men: 1
#  eligible_q_9_16: 1
#  where_live: 1
#  where_live_other: MyString
#  willing_to_refer: 1
#  matched_to_ego: 1
#  eligible: 1
#  name_of_screener: MyString
#  location_of_screening: MyString
#  date_of_screening: 2016-10-26
#  time_of_screening: 12:12
#  referred_for_interview: 1
#  referred_appointment_date: 2016-10-26
#  referred_appointment_time: 12:12
#  reason_for_refusal: 1
#  reason_for_refusal_other: MyString
	end

	factory :interview_note do
		data_entry_name ""
#  participant_id: MyString
#  interview_date: 2016-11-28
#  interviewer: Me
#  interview_notes: MyText
	end

	factory :rails_role do
		sequence(:name) { |n| "Name #{n}" }
	end

	factory :rails_user do
		sequence(:login) { |n| "Name #{n}" }
		password 'alphaV@1!d'
		password_confirmation 'alphaV@1!d'
	end

	factory :sti_questionnaire do
		data_entry_name ""
#  date_of_visit: 2017-02-01
#  participant_id: MyString
#  staff_person: MyString
#  stitest_ev: 1
#  stitest_a: false
#  stitest_b: false
#  stitest_c: false
#  stitest_d: false
#  stitest_e: false
#  stitest_f: false
#  stitest_g: false
#  stitest_h: false
#  stitest_i: false
#  stitest_j: false
#  stitest_other: MyString
#  stitest_last: 2017-02-01
#  stitest_last_never: false
#  stitest_reason_a: false
#  stitest_reason_b: false
#  stitest_reason_c: false
#  stitest_reason_d: false
#  stitest_reason_e: false
#  stitest_reason_f: false
#  stitest_reason_g: false
#  stitest_reason_h: false
#  stitest_reason_i: false
#  stitest_reason_other: MyString
#  stitest_locn: 1
#  stitest_rslt: 1
#  notest_reason_a: false
#  notest_reason_b: false
#  notest_reason_c: false
#  notest_reason_d: false
#  notest_reason_e: false
#  notest_reason_f: false
#  notest_reason_g: false
#  notest_reason_h: false
#  notest_reason_i: false
#  notest_reason_other: Other Reason
#  stitest_future: 1
#  stipercrisk: 1
#  stistigma: 1
	end

	factory :testing_facilitation do
		data_entry_name ""
#  date_of_visit: 2016-11-16
#  participant_id: MyString
#  staff_person: MyString
#  agree_to_use_home_test_kit_at_site: 1
#  agree_to_use_home_test_kit_at_site_refusal_reason: MyString
#  agree_to_take_test_kit_home: 1
#  agree_to_take_test_kit_home_refusal_reason: MyString
#  agree_to_tell_result_of_home_test_kit: 1
#  agree_to_tell_result_of_home_test_kit_refusal_reason: MyString
#  result_of_home_test_kit: 1
#  confirmatory_test_referred_location: 1
#  confirmatory_test_referred_appointment: 2016-11-16 13:49:40
#  confirmatory_test_referred_location_other: MyString
#  indeterminate_test_option: 1
#  indeterminate_test_result: MyString
#  indeterminate_test_referred_to: MyString
#  urine_to_test: 1
#  urine_to_test_refusal_reason: 1
#  urine_to_test_refusal_reason_other: MyString
#  gonorrhea_result: 1
#  chlamydia_result: 1
#  notes: MyText
	end

end
