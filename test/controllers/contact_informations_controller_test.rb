require 'test_helper'

class ContactInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_information = contact_informations(:one)
  end

  test "should get index" do
    get contact_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_information_url
    assert_response :success
  end

  test "should create contact_information" do
    assert_difference('ContactInformation.count') do
      post contact_informations_url, params: { contact_information: { age: @contact_information.age, alternate_names: @contact_information.alternate_names, build: @contact_information.build, dob: @contact_information.dob, email: @contact_information.email, eye_color: @contact_information.eye_color, first_name: @contact_information.first_name, hair: @contact_information.hair, height: @contact_information.height, last_name: @contact_information.last_name, middle_name: @contact_information.middle_name, ok_to_mail_negative_test_result: @contact_information.ok_to_mail_negative_test_result, other_identifying_marks: @contact_information.other_identifying_marks, other_person_ok_to_pass_message: @contact_information.other_person_ok_to_pass_message, other_person_phone: @contact_information.other_person_phone, other_person_relationship: @contact_information.other_person_relationship, primary_address: @contact_information.primary_address, primary_city: @contact_information.primary_city, primary_phone_message: @contact_information.primary_phone_message, primary_phone_number: @contact_information.primary_phone_number, primary_phone_text: @contact_information.primary_phone_text, primary_phone_type: @contact_information.primary_phone_type, primary_state: @contact_information.primary_state, primary_zip: @contact_information.primary_zip, race: @contact_information.race, referral_source: @contact_information.referral_source, secondary_address: @contact_information.secondary_address, secondary_city: @contact_information.secondary_city, secondary_phone_message: @contact_information.secondary_phone_message, secondary_phone_number: @contact_information.secondary_phone_number, secondary_phone_text: @contact_information.secondary_phone_text, secondary_phone_type: @contact_information.secondary_phone_type, secondary_state: @contact_information.secondary_state, secondary_zip: @contact_information.secondary_zip, tertiary_phone_message: @contact_information.tertiary_phone_message, tertiary_phone_number: @contact_information.tertiary_phone_number, tertiary_phone_text: @contact_information.tertiary_phone_text, tertiary_phone_type: @contact_information.tertiary_phone_type } }
    end

    assert_redirected_to contact_information_url(ContactInformation.last)
  end

  test "should show contact_information" do
    get contact_information_url(@contact_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_information_url(@contact_information)
    assert_response :success
  end

  test "should update contact_information" do
    patch contact_information_url(@contact_information), params: { contact_information: { age: @contact_information.age, alternate_names: @contact_information.alternate_names, build: @contact_information.build, dob: @contact_information.dob, email: @contact_information.email, eye_color: @contact_information.eye_color, first_name: @contact_information.first_name, hair: @contact_information.hair, height: @contact_information.height, last_name: @contact_information.last_name, middle_name: @contact_information.middle_name, ok_to_mail_negative_test_result: @contact_information.ok_to_mail_negative_test_result, other_identifying_marks: @contact_information.other_identifying_marks, other_person_ok_to_pass_message: @contact_information.other_person_ok_to_pass_message, other_person_phone: @contact_information.other_person_phone, other_person_relationship: @contact_information.other_person_relationship, primary_address: @contact_information.primary_address, primary_city: @contact_information.primary_city, primary_phone_message: @contact_information.primary_phone_message, primary_phone_number: @contact_information.primary_phone_number, primary_phone_text: @contact_information.primary_phone_text, primary_phone_type: @contact_information.primary_phone_type, primary_state: @contact_information.primary_state, primary_zip: @contact_information.primary_zip, race: @contact_information.race, referral_source: @contact_information.referral_source, secondary_address: @contact_information.secondary_address, secondary_city: @contact_information.secondary_city, secondary_phone_message: @contact_information.secondary_phone_message, secondary_phone_number: @contact_information.secondary_phone_number, secondary_phone_text: @contact_information.secondary_phone_text, secondary_phone_type: @contact_information.secondary_phone_type, secondary_state: @contact_information.secondary_state, secondary_zip: @contact_information.secondary_zip, tertiary_phone_message: @contact_information.tertiary_phone_message, tertiary_phone_number: @contact_information.tertiary_phone_number, tertiary_phone_text: @contact_information.tertiary_phone_text, tertiary_phone_type: @contact_information.tertiary_phone_type } }
    assert_redirected_to contact_information_url(@contact_information)
  end

  test "should destroy contact_information" do
    assert_difference('ContactInformation.count', -1) do
      delete contact_information_url(@contact_information)
    end

    assert_redirected_to contact_informations_url
  end
end