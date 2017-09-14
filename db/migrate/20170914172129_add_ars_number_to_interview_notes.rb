class AddArsNumberToInterviewNotes < ActiveRecord::Migration[5.1]
	def change
		add_column :interview_notes, :ars_number, :string, limit: 10
	end
end
