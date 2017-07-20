require 'test_helper'

class StiQuestionnairesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@sti_questionnaire = FactoryGirl.create(:sti_questionnaire)
	end

	%w{admin dataentry readonly}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaires_url
			assert_response :success
		end
	
		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaires_url( format: 'csv' )
			assert_response :success
		end
	
		test "should show sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaire_url(@sti_questionnaire)
			assert_response :success
		end
	
	end

	%w{admin dataentry}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_sti_questionnaire_url
			assert_response :success
		end
	
		test "should create sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:sti_questionnaire).attributes
				.except('id','created_at','updated_at')
			assert_difference('StiQuestionnaire.count') do
				post sti_questionnaires_url, params: { sti_questionnaire: params }
			end
			assert_redirected_to sti_questionnaire_url(StiQuestionnaire.last)
		end
	
		test "should not create sti_questionnaire with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:sti_questionnaire).attributes
				.except('id','created_at','updated_at')
			StiQuestionnaire.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('StiQuestionnaire.count',0) do
				post sti_questionnaires_url, params: { sti_questionnaire: params }
			end
			assert_response :success
			assert_template :new
		end

	end
	
	%w{admin}.each do |login|

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_sti_questionnaire_url(@sti_questionnaire)
			assert_response :success
		end
	
		test "should update sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:sti_questionnaire).attributes
				.except('id','created_at','updated_at')
			patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: params }
			assert_redirected_to sti_questionnaire_url(@sti_questionnaire)
		end
	
		test "should not update sti_questionnaire with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:sti_questionnaire).attributes
				.except('id','created_at','updated_at')
			StiQuestionnaire.any_instance.stubs(:create_or_update).returns(false)
			patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: params }
			assert_response :success
			assert_template :edit
		end
	
		test "should destroy sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			assert_difference('StiQuestionnaire.count', -1) do
				delete sti_questionnaire_url(@sti_questionnaire)
			end
			assert_redirected_to sti_questionnaires_url
		end
	end

	%w{readonly}.each do |login|

		test "should not get new with #{login} login" do
			create_and_login_as(login)
			get new_sti_questionnaire_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not create sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:sti_questionnaire).attributes
				.except('id','created_at','updated_at')
			assert_difference('StiQuestionnaire.count',0) do
				post sti_questionnaires_url, params: { sti_questionnaire: params }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end
	
	%w{dataentry readonly}.each do |login|

		test "should not get edit with #{login} login" do
			create_and_login_as(login)
			get edit_sti_questionnaire_url(@sti_questionnaire)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not update sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:sti_questionnaire).attributes
				.except('id','created_at','updated_at')
			patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should not destroy sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			assert_difference('StiQuestionnaire.count', 0) do
				delete sti_questionnaire_url(@sti_questionnaire)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

#	TODO add failed nologin tests

end
