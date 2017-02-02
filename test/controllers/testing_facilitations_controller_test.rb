require 'test_helper'

class TestingFacilitationsControllerTest < ActionDispatch::IntegrationTest

	setup do
		@testing_facilitation = testing_facilitations(:one)
	end

	%w{admin nonadmin}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get testing_facilitations_url
			assert_response :success
		end
	
		test "should show testing_facilitation with #{login} login" do
			create_and_login_as(login)
			get testing_facilitation_url(@testing_facilitation)
			assert_response :success
		end
	
	end

	%w{admin}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_testing_facilitation_url
			assert_response :success
		end
	
		test "should create testing_facilitation with #{login} login" do
			create_and_login_as(login)
			assert_difference('TestingFacilitation.count') do
				post testing_facilitations_url, params: { testing_facilitation: { agree_to_take_test_kit_home: @testing_facilitation.agree_to_take_test_kit_home, agree_to_take_test_kit_home_refusal_reason: @testing_facilitation.agree_to_take_test_kit_home_refusal_reason, agree_to_tell_result_of_home_test_kit: @testing_facilitation.agree_to_tell_result_of_home_test_kit, agree_to_tell_result_of_home_test_kit_refusal_reason: @testing_facilitation.agree_to_tell_result_of_home_test_kit_refusal_reason, agree_to_use_home_test_kit_at_site: @testing_facilitation.agree_to_use_home_test_kit_at_site, agree_to_use_home_test_kit_at_site_refusal_reason: @testing_facilitation.agree_to_use_home_test_kit_at_site_refusal_reason, confirmatory_test_referred_appointment: @testing_facilitation.confirmatory_test_referred_appointment, confirmatory_test_referred_location: @testing_facilitation.confirmatory_test_referred_location, confirmatory_test_referred_location_other: @testing_facilitation.confirmatory_test_referred_location_other, date_of_visit: @testing_facilitation.date_of_visit, indeterminate_test_option: @testing_facilitation.indeterminate_test_option, indeterminate_test_referred_to: @testing_facilitation.indeterminate_test_referred_to, indeterminate_test_result: @testing_facilitation.indeterminate_test_result, notes: @testing_facilitation.notes, participant_id: @testing_facilitation.participant_id, result_of_home_test_kit: @testing_facilitation.result_of_home_test_kit, staff_person: @testing_facilitation.staff_person, urine_to_test: @testing_facilitation.urine_to_test, urine_to_test_refusal_reason: @testing_facilitation.urine_to_test_refusal_reason, urine_to_test_refusal_reason_other: @testing_facilitation.urine_to_test_refusal_reason_other } }
			end
			assert_redirected_to testing_facilitation_url(TestingFacilitation.last)
		end
	
		test "should not create testing_facilitation with #{login} login if save fails" do
			create_and_login_as(login)
			TestingFacilitation.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('TestingFacilitation.count',0) do
				post testing_facilitations_url, params: { testing_facilitation: { agree_to_take_test_kit_home: @testing_facilitation.agree_to_take_test_kit_home, agree_to_take_test_kit_home_refusal_reason: @testing_facilitation.agree_to_take_test_kit_home_refusal_reason, agree_to_tell_result_of_home_test_kit: @testing_facilitation.agree_to_tell_result_of_home_test_kit, agree_to_tell_result_of_home_test_kit_refusal_reason: @testing_facilitation.agree_to_tell_result_of_home_test_kit_refusal_reason, agree_to_use_home_test_kit_at_site: @testing_facilitation.agree_to_use_home_test_kit_at_site, agree_to_use_home_test_kit_at_site_refusal_reason: @testing_facilitation.agree_to_use_home_test_kit_at_site_refusal_reason, confirmatory_test_referred_appointment: @testing_facilitation.confirmatory_test_referred_appointment, confirmatory_test_referred_location: @testing_facilitation.confirmatory_test_referred_location, confirmatory_test_referred_location_other: @testing_facilitation.confirmatory_test_referred_location_other, date_of_visit: @testing_facilitation.date_of_visit, indeterminate_test_option: @testing_facilitation.indeterminate_test_option, indeterminate_test_referred_to: @testing_facilitation.indeterminate_test_referred_to, indeterminate_test_result: @testing_facilitation.indeterminate_test_result, notes: @testing_facilitation.notes, participant_id: @testing_facilitation.participant_id, result_of_home_test_kit: @testing_facilitation.result_of_home_test_kit, staff_person: @testing_facilitation.staff_person, urine_to_test: @testing_facilitation.urine_to_test, urine_to_test_refusal_reason: @testing_facilitation.urine_to_test_refusal_reason, urine_to_test_refusal_reason_other: @testing_facilitation.urine_to_test_refusal_reason_other } }
			end
			assert_response :success
			assert_template :new
		end
	
		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_testing_facilitation_url(@testing_facilitation)
			assert_response :success
		end
	
		test "should update testing_facilitation with #{login} login" do
			create_and_login_as(login)
			patch testing_facilitation_url(@testing_facilitation), params: { testing_facilitation: { agree_to_take_test_kit_home: @testing_facilitation.agree_to_take_test_kit_home, agree_to_take_test_kit_home_refusal_reason: @testing_facilitation.agree_to_take_test_kit_home_refusal_reason, agree_to_tell_result_of_home_test_kit: @testing_facilitation.agree_to_tell_result_of_home_test_kit, agree_to_tell_result_of_home_test_kit_refusal_reason: @testing_facilitation.agree_to_tell_result_of_home_test_kit_refusal_reason, agree_to_use_home_test_kit_at_site: @testing_facilitation.agree_to_use_home_test_kit_at_site, agree_to_use_home_test_kit_at_site_refusal_reason: @testing_facilitation.agree_to_use_home_test_kit_at_site_refusal_reason, confirmatory_test_referred_appointment: @testing_facilitation.confirmatory_test_referred_appointment, confirmatory_test_referred_location: @testing_facilitation.confirmatory_test_referred_location, confirmatory_test_referred_location_other: @testing_facilitation.confirmatory_test_referred_location_other, date_of_visit: @testing_facilitation.date_of_visit, indeterminate_test_option: @testing_facilitation.indeterminate_test_option, indeterminate_test_referred_to: @testing_facilitation.indeterminate_test_referred_to, indeterminate_test_result: @testing_facilitation.indeterminate_test_result, notes: @testing_facilitation.notes, participant_id: @testing_facilitation.participant_id, result_of_home_test_kit: @testing_facilitation.result_of_home_test_kit, staff_person: @testing_facilitation.staff_person, urine_to_test: @testing_facilitation.urine_to_test, urine_to_test_refusal_reason: @testing_facilitation.urine_to_test_refusal_reason, urine_to_test_refusal_reason_other: @testing_facilitation.urine_to_test_refusal_reason_other } }
			assert_redirected_to testing_facilitation_url(@testing_facilitation)
		end

		test "should not update testing_facilitation with #{login} login if save fails" do
			create_and_login_as(login)
			TestingFacilitation.any_instance.stubs(:create_or_update).returns(false)
			patch testing_facilitation_url(@testing_facilitation), params: { testing_facilitation: { agree_to_take_test_kit_home: @testing_facilitation.agree_to_take_test_kit_home, agree_to_take_test_kit_home_refusal_reason: @testing_facilitation.agree_to_take_test_kit_home_refusal_reason, agree_to_tell_result_of_home_test_kit: @testing_facilitation.agree_to_tell_result_of_home_test_kit, agree_to_tell_result_of_home_test_kit_refusal_reason: @testing_facilitation.agree_to_tell_result_of_home_test_kit_refusal_reason, agree_to_use_home_test_kit_at_site: @testing_facilitation.agree_to_use_home_test_kit_at_site, agree_to_use_home_test_kit_at_site_refusal_reason: @testing_facilitation.agree_to_use_home_test_kit_at_site_refusal_reason, confirmatory_test_referred_appointment: @testing_facilitation.confirmatory_test_referred_appointment, confirmatory_test_referred_location: @testing_facilitation.confirmatory_test_referred_location, confirmatory_test_referred_location_other: @testing_facilitation.confirmatory_test_referred_location_other, date_of_visit: @testing_facilitation.date_of_visit, indeterminate_test_option: @testing_facilitation.indeterminate_test_option, indeterminate_test_referred_to: @testing_facilitation.indeterminate_test_referred_to, indeterminate_test_result: @testing_facilitation.indeterminate_test_result, notes: @testing_facilitation.notes, participant_id: @testing_facilitation.participant_id, result_of_home_test_kit: @testing_facilitation.result_of_home_test_kit, staff_person: @testing_facilitation.staff_person, urine_to_test: @testing_facilitation.urine_to_test, urine_to_test_refusal_reason: @testing_facilitation.urine_to_test_refusal_reason, urine_to_test_refusal_reason_other: @testing_facilitation.urine_to_test_refusal_reason_other } }
			assert_response :success
			assert_template :edit
		end
	
		test "should destroy testing_facilitation with #{login} login" do
			create_and_login_as(login)
			assert_difference('TestingFacilitation.count', -1) do
				delete testing_facilitation_url(@testing_facilitation)
			end
			assert_redirected_to testing_facilitations_url
		end

	end

	%w{nonadmin}.each do |login|

		test "should not get new with #{login} login" do
			create_and_login_as(login)
			get new_testing_facilitation_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not create testing_facilitation with #{login} login" do
			create_and_login_as(login)
			assert_difference('TestingFacilitation.count',0) do
				post testing_facilitations_url, params: { testing_facilitation: { agree_to_take_test_kit_home: @testing_facilitation.agree_to_take_test_kit_home, agree_to_take_test_kit_home_refusal_reason: @testing_facilitation.agree_to_take_test_kit_home_refusal_reason, agree_to_tell_result_of_home_test_kit: @testing_facilitation.agree_to_tell_result_of_home_test_kit, agree_to_tell_result_of_home_test_kit_refusal_reason: @testing_facilitation.agree_to_tell_result_of_home_test_kit_refusal_reason, agree_to_use_home_test_kit_at_site: @testing_facilitation.agree_to_use_home_test_kit_at_site, agree_to_use_home_test_kit_at_site_refusal_reason: @testing_facilitation.agree_to_use_home_test_kit_at_site_refusal_reason, confirmatory_test_referred_appointment: @testing_facilitation.confirmatory_test_referred_appointment, confirmatory_test_referred_location: @testing_facilitation.confirmatory_test_referred_location, confirmatory_test_referred_location_other: @testing_facilitation.confirmatory_test_referred_location_other, date_of_visit: @testing_facilitation.date_of_visit, indeterminate_test_option: @testing_facilitation.indeterminate_test_option, indeterminate_test_referred_to: @testing_facilitation.indeterminate_test_referred_to, indeterminate_test_result: @testing_facilitation.indeterminate_test_result, notes: @testing_facilitation.notes, participant_id: @testing_facilitation.participant_id, result_of_home_test_kit: @testing_facilitation.result_of_home_test_kit, staff_person: @testing_facilitation.staff_person, urine_to_test: @testing_facilitation.urine_to_test, urine_to_test_refusal_reason: @testing_facilitation.urine_to_test_refusal_reason, urine_to_test_refusal_reason_other: @testing_facilitation.urine_to_test_refusal_reason_other } }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not get edit with #{login} login" do
			create_and_login_as(login)
			get edit_testing_facilitation_url(@testing_facilitation)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not update testing_facilitation with #{login} login" do
			create_and_login_as(login)
			patch testing_facilitation_url(@testing_facilitation), params: { testing_facilitation: { agree_to_take_test_kit_home: @testing_facilitation.agree_to_take_test_kit_home, agree_to_take_test_kit_home_refusal_reason: @testing_facilitation.agree_to_take_test_kit_home_refusal_reason, agree_to_tell_result_of_home_test_kit: @testing_facilitation.agree_to_tell_result_of_home_test_kit, agree_to_tell_result_of_home_test_kit_refusal_reason: @testing_facilitation.agree_to_tell_result_of_home_test_kit_refusal_reason, agree_to_use_home_test_kit_at_site: @testing_facilitation.agree_to_use_home_test_kit_at_site, agree_to_use_home_test_kit_at_site_refusal_reason: @testing_facilitation.agree_to_use_home_test_kit_at_site_refusal_reason, confirmatory_test_referred_appointment: @testing_facilitation.confirmatory_test_referred_appointment, confirmatory_test_referred_location: @testing_facilitation.confirmatory_test_referred_location, confirmatory_test_referred_location_other: @testing_facilitation.confirmatory_test_referred_location_other, date_of_visit: @testing_facilitation.date_of_visit, indeterminate_test_option: @testing_facilitation.indeterminate_test_option, indeterminate_test_referred_to: @testing_facilitation.indeterminate_test_referred_to, indeterminate_test_result: @testing_facilitation.indeterminate_test_result, notes: @testing_facilitation.notes, participant_id: @testing_facilitation.participant_id, result_of_home_test_kit: @testing_facilitation.result_of_home_test_kit, staff_person: @testing_facilitation.staff_person, urine_to_test: @testing_facilitation.urine_to_test, urine_to_test_refusal_reason: @testing_facilitation.urine_to_test_refusal_reason, urine_to_test_refusal_reason_other: @testing_facilitation.urine_to_test_refusal_reason_other } }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not destroy testing_facilitation with #{login} login" do
			create_and_login_as(login)
			assert_difference('TestingFacilitation.count', 0) do
				delete testing_facilitation_url(@testing_facilitation)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

#	TODO add failed nologin tests

end
