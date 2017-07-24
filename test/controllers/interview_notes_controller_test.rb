require 'test_helper'

class InterviewNotesControllerTest < ActionDispatch::IntegrationTest

	setup do
		@interview_note = FactoryGirl.create(:interview_note)
	end

	%w{admin}.each do |login|

		test "should get index.csv with #{login} login" do
			create_and_login_as(login)
			get interview_notes_url( format: 'csv' )
			assert_nil flash[:warn]
			assert_response :success
		end
	
	end

	%w{nonadmin create read update destroy}.each do |login|

		test "should NOT get index.csv with #{login} login" do
			create_and_login_as(login)
			get interview_notes_url( format: 'csv' )
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
	end

	%w{admin read}.each do |login|

		test "should get index with #{login} login" do
			create_and_login_as(login)
			get interview_notes_url
			assert_nil flash[:warn]
			assert_response :success
		end
	
		test "should show interview_note with #{login} login" do
			create_and_login_as(login)
			get interview_note_url(@interview_note)
			assert_nil flash[:warn]
			assert_response :success
		end
	
	end

	%w{nonadmin create update destroy}.each do |login|

		test "should NOT get index with #{login} login" do
			create_and_login_as(login)
			get interview_notes_url
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
		test "should NOT show interview_note with #{login} login" do
			create_and_login_as(login)
			get interview_note_url(@interview_note)
			assert_not_nil flash[:warn]
			assert_redirected_to root_url
		end
	
	end

	%w{admin create}.each do |login|

		test "should get new with #{login} login" do
			create_and_login_as(login)
			get new_interview_note_url
			assert_response :success
		end
	
		test "should create interview_note with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:interview_note).attributes
				.except('id','created_at','updated_at')
			assert_difference('InterviewNote.count') do
				post interview_notes_url, params: { interview_note: params }
			end
			assert_redirected_to interview_note_url(InterviewNote.last)
		end
	
		test "should not create interview_note with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:interview_note).attributes
				.except('id','created_at','updated_at')
			InterviewNote.any_instance.stubs(:create_or_update).returns(false)
			assert_difference('InterviewNote.count',0) do
				post interview_notes_url, params: { interview_note: params }
			end
			assert_response :success
			assert_template :new
		end

	end

	%w{nonadmin read update destroy}.each do |login|

		test "should NOT get new with #{login} login" do
			create_and_login_as(login)
			get new_interview_note_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should NOT create interview_note with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:interview_note).attributes
				.except('id','created_at','updated_at')
			assert_difference('InterviewNote.count', 0) do
				post interview_notes_url, params: { interview_note: params }
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end

	%w{admin update}.each do |login|
	
		test "should get edit with #{login} login" do
			create_and_login_as(login)
			get edit_interview_note_url(@interview_note)
			assert_response :success
		end
	
		test "should update interview_note with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:interview_note).attributes
				.except('id','created_at','updated_at')
			patch interview_note_url(@interview_note), params: { interview_note: params }
			assert_redirected_to interview_note_url(@interview_note)
		end
	
		test "should not update interview_note with #{login} login if save fails" do
			create_and_login_as(login)
			params = FactoryGirl.build(:interview_note).attributes
				.except('id','created_at','updated_at')
			InterviewNote.any_instance.stubs(:create_or_update).returns(false)
			patch interview_note_url(@interview_note), params: { interview_note: params }
			assert_response :success
			assert_template :edit
		end

	end
	
	%w{nonadmin create read destroy}.each do |login|

		test "should NOT get edit with #{login} login" do
			create_and_login_as(login)
			get edit_interview_note_url(@interview_note)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
		test "should NOT update interview_note with #{login} login" do
			create_and_login_as(login)
			params = FactoryGirl.build(:interview_note).attributes
				.except('id','created_at','updated_at')
			patch interview_note_url(@interview_note), params: { interview_note: params }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end
	
	end

	%w{admin destroy}.each do |login|
	
		test "should destroy interview_note with #{login} login" do
			create_and_login_as(login)
			assert_difference('InterviewNote.count', -1) do
				delete interview_note_url(@interview_note)
			end
			assert_redirected_to interview_notes_url
		end

	end

	%w{nonadmin create read update}.each do |login|

		test "should NOT destroy interview_note with #{login} login" do
			create_and_login_as(login)
			assert_difference('InterviewNote.count', 0) do
				delete interview_note_url(@interview_note)
			end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
		end

	end


#	TODO add failed nologin tests

end
