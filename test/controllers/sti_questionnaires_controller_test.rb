require 'test_helper'

class StiQuestionnairesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@sti_questionnaire = FactoryGirl.create(:sti_questionnaire)
		@params = FactoryGirl.build(:sti_questionnaire).attributes
			.with_indifferent_access
			.except(:id,:created_at,:updated_at,:data_entry_name)
	end

	%w{admin}.each do |login|

		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaires_url( format: 'csv' )
			assert_nil flash[:warn]
			assert_response :success
		end
	
	end

	%w{nonadmin create read update destroy}.each do |login|

		test "should NOT get index.csv with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaires_url( format: 'csv' )
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
	end

	%w{admin read}.each do |login|

		test "should get FULL index with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaires_url
			assert_nil flash[:warn]
			assert_response :success
			assert_select 'th', count: 48
		end

		test "should show sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaire_url(@sti_questionnaire)
			assert_nil flash[:warn]
			assert_response :success
		end
	
	end

	%w{nonadmin create update destroy}.each do |login|

		test "should get LIMITED index with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaires_url
			assert_nil flash[:warn]
			assert_response :success
			assert_select 'th', count: 3
		end

#		test "should NOT get index with #{login} login" do
#			create_and_login_as(login)
#			get sti_questionnaires_url
#			assert_not_nil flash[:warn]
#			assert_redirected_to root_url
#		end
	
		test "should NOT show sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			get sti_questionnaire_url(@sti_questionnaire)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end

	end

	%w{admin create}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_sti_questionnaire_url
			assert_response :success
		end
	
		test "should create sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			assert_difference('StiQuestionnaire.count') do
				post sti_questionnaires_url, params: { sti_questionnaire: @params }
			end
			assert_equal assigns(:sti_questionnaire).data_entry_name, login
			assert_redirected_to sti_questionnaire_url(assigns(:sti_questionnaire))
		end
	
		test "should not create sti_questionnaire with #{login} login if save fails" do
			create_and_login_as(login)
			StiQuestionnaire.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('StiQuestionnaire.count',0) do
				post sti_questionnaires_url, params: { sti_questionnaire: @params }
			end
			assert_response :success
			assert_template :new
		end

	end
	
	%w{nonadmin read update destroy}.each do |login|

		test "should NOT get new with #{login} login" do
			create_and_login_as(login)
			get new_sti_questionnaire_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should NOT create sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			assert_difference('StiQuestionnaire.count',0) do
				post sti_questionnaires_url, params: { sti_questionnaire: @params }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end


	%w{admin update}.each do |login|

		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_sti_questionnaire_url(@sti_questionnaire)
			assert_response :success
		end
	
		test "should update sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: @params }
			assert_equal assigns(:sti_questionnaire).data_entry_name, ", #{login}"
			assert_redirected_to sti_questionnaire_url(@sti_questionnaire)
		end
	
		test "should not update sti_questionnaire with #{login} login if save fails" do
			create_and_login_as(login)
			StiQuestionnaire.any_instance.stubs(:create_or_update).returns(false)
			patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: @params }
			assert_response :success
			assert_template :edit
		end
	
	end

	%w{noadmin create read destroy}.each do |login|

		test "should NOT get edit with #{login} login" do
			create_and_login_as(login)
			get edit_sti_questionnaire_url(@sti_questionnaire)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should NOT update sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			patch sti_questionnaire_url(@sti_questionnaire), params: { sti_questionnaire: @params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

	%w{admin destroy}.each do |login|

		test "should destroy sti_questionnaire with #{login} login" do
			create_and_login_as(login)
			assert_difference('StiQuestionnaire.count', -1) do
				delete sti_questionnaire_url(@sti_questionnaire)
			end
			assert_redirected_to sti_questionnaires_url
		end
	end

	%w{nonadmin create read update}.each do |login|

		test "should NOT destroy sti_questionnaire with #{login} login" do
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
