class AddDataEntryNameToTestingFacilitations < ActiveRecord::Migration[5.0]
	def change
		add_column :testing_facilitations, :data_entry_name, :string
	end
end
