class AddAgeOtherToEligibilityScreenings < ActiveRecord::Migration[5.0]
	def change
		add_column :eligibility_screenings, :age_other, :string
	end
end
