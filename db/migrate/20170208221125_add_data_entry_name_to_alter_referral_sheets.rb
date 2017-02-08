class AddDataEntryNameToAlterReferralSheets < ActiveRecord::Migration[5.0]
	def change
		add_column :alter_referral_sheets, :data_entry_name, :string
	end
end
