class CreateAlterReferralSheets < ActiveRecord::Migration[5.0]
	def change
		create_table :alter_referral_sheets do |t|
			t.string :data_entry_name
			t.string :ego_id
			t.integer :alter_referrals_count, :default => 0
			t.timestamps
		end
	end
end
