require 'test_helper'

class InterviewNotesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @interview_note = interview_notes(:one)
  end

	%w{admin nonadmin}.each do |login|

	  test "should get index with #{login} login" do
			create_and_login_as(login)
	    get interview_notes_url
	    assert_response :success
	  end
	
	  test "should show interview_note with #{login} login" do
			create_and_login_as(login)
	    get interview_note_url(@interview_note)
	    assert_response :success
	  end
	
	end

	%w{admin}.each do |login|

	  test "should get new with #{login} login" do
			create_and_login_as(login)
	    get new_interview_note_url
	    assert_response :success
	  end
	
	  test "should create interview_note with #{login} login" do
			create_and_login_as(login)
	    assert_difference('InterviewNote.count') do
	      post interview_notes_url, params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes, interviewer: @interview_note.interviewer } }
	    end
	    assert_redirected_to interview_note_url(InterviewNote.last)
	  end
	
	  test "should not create interview_note with #{login} login if save fails" do
			create_and_login_as(login)
			InterviewNote.any_instance.stubs(:create_or_update).returns(false)
	    assert_difference('InterviewNote.count',0) do
	      post interview_notes_url, params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes, interviewer: @interview_note.interviewer } }
	    end
	    assert_response :success
			assert_template :new
	  end
	
	  test "should get edit with #{login} login" do
			create_and_login_as(login)
	    get edit_interview_note_url(@interview_note)
	    assert_response :success
	  end
	
	  test "should update interview_note with #{login} login" do
			create_and_login_as(login)
	    patch interview_note_url(@interview_note), params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes, interviewer: @interview_note.interviewer } }
	    assert_redirected_to interview_note_url(@interview_note)
	  end
	
	  test "should not update interview_note with #{login} login if save fails" do
			create_and_login_as(login)
			InterviewNote.any_instance.stubs(:create_or_update).returns(false)
	    patch interview_note_url(@interview_note), params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes, interviewer: @interview_note.interviewer } }
	    assert_response :success
			assert_template :edit
	  end
	
	  test "should destroy interview_note with #{login} login" do
			create_and_login_as(login)
	    assert_difference('InterviewNote.count', -1) do
	      delete interview_note_url(@interview_note)
	    end
	    assert_redirected_to interview_notes_url
	  end
	end

	%w{nonadmin}.each do |login|

	  test "should not get new with #{login} login" do
			create_and_login_as(login)
	    get new_interview_note_url
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
	  end
	
	  test "should not create interview_note with #{login} login" do
			create_and_login_as(login)
	    assert_difference('InterviewNote.count', 0) do
	      post interview_notes_url, params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes, interviewer: @interview_note.interviewer } }
	    end
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
	  end
	
	  test "should not get edit with #{login} login" do
			create_and_login_as(login)
	    get edit_interview_note_url(@interview_note)
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
	  end
	
	  test "should not update interview_note with #{login} login" do
			create_and_login_as(login)
	    patch interview_note_url(@interview_note), params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes, interviewer: @interview_note.interviewer } }
			assert_redirected_to root_url
			assert_not_nil flash[:warn]
	  end
	
	  test "should not destroy interview_note with #{login} login" do
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
