class AddDataEntryNameToContactInformations < ActiveRecord::Migration[5.0]
	def change
		add_column :contact_informations, :data_entry_name, :string
	end
end
