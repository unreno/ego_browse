class CreateAlterReferrals < ActiveRecord::Migration[5.0]
	def change
		create_table :alter_referrals do |t|
			t.references :alter_referral_sheet
			t.boolean :plan_to_refer
			t.string :first_name
			t.string :last_initial, limit: 1
			t.string :last_4_cell, limit: 4
			t.string :date_of_alter_interview
			t.string :alter_id
			t.string :date_ego_notified
			t.string :date_ego_paid

			t.timestamps
		end
	end
end
