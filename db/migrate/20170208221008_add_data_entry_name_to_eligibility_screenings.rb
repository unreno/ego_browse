class AddDataEntryNameToEligibilityScreenings < ActiveRecord::Migration[5.0]
	def change
		add_column :eligibility_screenings, :data_entry_name, :string
	end
end
