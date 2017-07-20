require 'test_helper'

class ContactInformationsControllerTest < ActionDispatch::IntegrationTest

	setup do
		@contact_information = FactoryGirl.create(:contact_information)
	end

	%w{admin dataentry readonly}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get contact_informations_url
			assert_response :success
		end
	
		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get contact_informations_url( format: 'csv' )
			assert_response :success
		end
	
		test "should show contact_information with #{login} login" do
			create_and_login_as(login)
			get contact_information_url(@contact_information)
			assert_response :success
		end
	
	end

	%w{admin dataentry}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_contact_information_url
			assert_response :success
		end
	
		test "should create contact_information with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:contact_information).attributes
				.except('id','created_at','updated_at')
			assert_difference('ContactInformation.count') do
				post contact_informations_url, params: { contact_information: params }
			end
			assert_redirected_to contact_information_url(ContactInformation.last)
		end
	
		test "should not create contact_information with #{login} login if save fails" do
			create_and_login_as(login)
			ContactInformation.any_instance.stubs(:create_or_update).returns(false)
			params = FactoryGirl.build(:contact_information).attributes
				.except('id','created_at','updated_at')
			assert_difference('ContactInformation.count',0) do
				post contact_informations_url, params: { contact_information: params }
			end
			assert_response :success
			assert_template :new
		end

	end
	
	%w{admin}.each do |login|

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_contact_information_url(@contact_information)
			assert_response :success
		end
	
		test "should update contact_information with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:contact_information).attributes
				.except('id','created_at','updated_at')
			patch contact_information_url(@contact_information), params: { contact_information: params }
			assert_redirected_to contact_information_url(@contact_information)
		end
	
		test "should not update contact_information with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:contact_information).attributes
				.except('id','created_at','updated_at')
			ContactInformation.any_instance.stubs(:create_or_update).returns(false)
			patch contact_information_url(@contact_information), params: { contact_information: params }
			assert_response :success
			assert_template :edit
		end
	
		test "should destroy contact_information with #{login} login" do
			create_and_login_as(login)
			assert_difference('ContactInformation.count', -1) do
				delete contact_information_url(@contact_information)
			end
			assert_redirected_to contact_informations_url
		end

	end

	%w{dataentry readonly}.each do |login|

		test "should not get edit with #{login} login" do
			create_and_login_as(login)
			get edit_contact_information_url(@contact_information)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not update contact_information with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:contact_information).attributes
				.except('id','created_at','updated_at')
			patch contact_information_url(@contact_information), params: { contact_information: params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not destroy contact_information with #{login} login" do
			create_and_login_as(login)
			assert_difference('ContactInformation.count',0) do
				delete contact_information_url(@contact_information)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

	%w{readonly}.each do |login|

		test "should not get new with #{login} login" do
			create_and_login_as(login)
			get new_contact_information_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not create contact_information with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:contact_information).attributes
				.except('id','created_at','updated_at')
			assert_difference('ContactInformation.count',0) do
				post contact_informations_url, params: { contact_information: params }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
	end

#	TODO add nologin tests

end
