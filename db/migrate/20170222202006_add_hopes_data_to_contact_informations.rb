class AddHopesDataToContactInformations < ActiveRecord::Migration[5.0]
	def change
		add_column :contact_informations, :hopes_data, :string, :limit => 1
		add_column :contact_informations, :future_data, :string, :limit => 1
	end
end
