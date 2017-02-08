class AddDataEntryNameToStiQuestionnaires < ActiveRecord::Migration[5.0]
	def change
		add_column :sti_questionnaires, :data_entry_name, :string
	end
end
