class CreateInterviewNotes < ActiveRecord::Migration[5.0]
	def change
		create_table :interview_notes do |t|
			t.string :participant_id
			t.date :interview_date
			t.string :interviewer
			t.text :interview_notes
			t.text :process_notes

			t.timestamps
		end
	end
end
