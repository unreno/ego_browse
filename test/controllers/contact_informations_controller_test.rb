require 'test_helper'

class ContactInformationsControllerTest < ActionDispatch::IntegrationTest

	setup do
		@contact_information = FactoryBot.create(:contact_information)
		@params = FactoryBot.build(:contact_information).attributes
			.with_indifferent_access
			.except(:id,:created_at,:updated_at,:data_entry_name)
	end

	%w{admin}.each do |login|

		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get contact_informations_url( format: 'csv' )
			assert_nil flash[:warn]
			assert_response :success
		end

	end

	%w{nonadmin create read update destroy}.each do |login|

		test "should NOT get index.csv with #{login} login" do
			create_and_login_as(login)
			get contact_informations_url( format: 'csv' )
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end
	

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get contact_informations_url
			assert_nil flash[:warn]
			assert_response :success
		end
	
		test "should show contact_information with #{login} login" do
			create_and_login_as(login)
			get contact_information_url(@contact_information)
			assert_nil flash[:warn]
			assert_response :success
		end
	
	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get contact_informations_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
		test "should NOT show contact_information with #{login} login" do
			create_and_login_as(login)
			get contact_information_url(@contact_information)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
	end

	%w{admin create}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_contact_information_url
			assert_response :success
		end
	
		test "should create contact_information with #{login} login" do
			create_and_login_as(login)
			assert_difference('ContactInformation.count') do
				post contact_informations_url, params: { contact_information: @params }
			end
			assert_equal assigns(:contact_information).data_entry_name, login
			assert_redirected_to contact_information_url(assigns(:contact_information))
		end
	
		test "should not create contact_information with #{login} login if save fails" do
			create_and_login_as(login)
			ContactInformation.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('ContactInformation.count',0) do
				post contact_informations_url, params: { contact_information: @params }
			end
			assert_response :success
			assert_template :new
		end

	end
	
	%w{nonadmin read update destroy }.each do |login|

		test "should NOT get new with #{login} login" do
			create_and_login_as(login)
			get new_contact_information_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
		test "should NOT create contact_information with #{login} login" do
			create_and_login_as(login)
			assert_difference('ContactInformation.count',0) do
				post contact_informations_url, params: { contact_information: @params }
			end
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
	end
	
	%w{admin update}.each do |login|

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_contact_information_url(@contact_information)
			assert_response :success
		end
	
		test "should update contact_information with #{login} login" do
			create_and_login_as(login)
			patch contact_information_url(@contact_information), params: { contact_information: @params }
			assert_equal assigns(:contact_information).data_entry_name, ", #{login}"
			assert_redirected_to contact_information_url(@contact_information)
		end
	
		test "should not update contact_information with #{login} login if save fails" do
			create_and_login_as(login)
			ContactInformation.any_instance.stubs(:create_or_update).returns(false)
			patch contact_information_url(@contact_information), params: { contact_information: @params }
			assert_response :success
			assert_template :edit
		end
	
	end
	
	%w{nonadmin create read destroy}.each do |login|

		test "should NOT get edit with #{login} login" do
			create_and_login_as(login)
			get edit_contact_information_url(@contact_information)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should NOT update contact_information with #{login} login" do
			create_and_login_as(login)
			patch contact_information_url(@contact_information), params: { contact_information: @params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

	%w{admin destroy}.each do |login|

		test "should destroy contact_information with #{login} login" do
			create_and_login_as(login)
			assert_difference('ContactInformation.count', -1) do
				delete contact_information_url(@contact_information)
			end
			assert_redirected_to contact_informations_url
		end

	end

	%w{nonadmin create read update}.each do |login|

		test "should NOT destroy contact_information with #{login} login" do
			create_and_login_as(login)
			assert_difference('ContactInformation.count',0) do
				delete contact_information_url(@contact_information)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end


#	TODO add nologin tests

end
