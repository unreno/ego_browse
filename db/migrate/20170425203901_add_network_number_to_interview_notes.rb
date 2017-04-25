class AddNetworkNumberToInterviewNotes < ActiveRecord::Migration[5.0]
	def change
		add_column :interview_notes, :network_number, :integer
	end
end
