class ChangeAlterReferralPlanToReferToInteger < ActiveRecord::Migration[5.0]
	def self.up
		change_column :alter_referrals, :plan_to_refer, :integer
	end
	def self.down
		change_column :alter_referrals, :plan_to_refer, :boolean
	end
end
