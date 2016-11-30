require 'test_helper'

class InterviewNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interview_note = interview_notes(:one)
#		RailsUser.any_instance.stubs(:is_admin?).returns(true)
  end

  test "should get index" do
    get interview_notes_url
    assert_response :success
  end

  test "should get new" do
#		RailsUserSession.create(rails_users(:one))
    get new_interview_note_url
    assert_response :success
  end

  test "should create interview_note" do
#		RailsUserSession.create(:login => "testuser", :password => "testpassword")
    assert_difference('InterviewNote.count') do
      post interview_notes_url, params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes } }
    end

    assert_redirected_to interview_note_url(InterviewNote.last)
  end

  test "should show interview_note" do
    get interview_note_url(@interview_note)
    assert_response :success
  end

  test "should get edit" do
#		RailsUserSession.create(:login => "testuser", :password => "testpassword")
    get edit_interview_note_url(@interview_note)
    assert_response :success
  end

  test "should update interview_note" do
#		RailsUserSession.create(:login => "testuser", :password => "testpassword")
    patch interview_note_url(@interview_note), params: { interview_note: { interview_date: @interview_note.interview_date, interview_notes: @interview_note.interview_notes, participant_id: @interview_note.participant_id, process_notes: @interview_note.process_notes } }
    assert_redirected_to interview_note_url(@interview_note)
  end

  test "should destroy interview_note" do
#		RailsUserSession.create(:login => "testuser", :password => "testpassword")
    assert_difference('InterviewNote.count', -1) do
      delete interview_note_url(@interview_note)
    end

    assert_redirected_to interview_notes_url
  end
end
