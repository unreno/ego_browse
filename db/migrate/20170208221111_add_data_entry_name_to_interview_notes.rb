class AddDataEntryNameToInterviewNotes < ActiveRecord::Migration[5.0]
	def change
		add_column :interview_notes, :data_entry_name, :string
	end
end
