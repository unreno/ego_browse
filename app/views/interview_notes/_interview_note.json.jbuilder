json.extract! interview_note, :id, :participant_id, :interview_date, :interview_notes, :process_notes, :created_at, :updated_at
json.url interview_note_url(interview_note, format: :json)