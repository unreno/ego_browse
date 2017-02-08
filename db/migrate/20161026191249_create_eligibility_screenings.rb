class CreateEligibilityScreenings < ActiveRecord::Migration[5.0]
	def change
		create_table :eligibility_screenings do |t|
			t.string :how_learned, limit: 20
			t.string :how_learned_other
			t.integer :age
			t.integer :gender
			t.integer :race
			t.string :race_other
			t.integer :children
			t.integer :seen_pcp
			t.string :marital, limit: 10
			t.integer :tested_hiv
			t.integer :tested_hiv_result
			t.integer :partner_count
			t.integer :injection_drugs
			t.integer :partner_injection_drugs
			t.integer :partner_noninjection_drugs
			t.integer :partner_hiv_positive
			t.integer :partner_other_partners
			t.integer :partner_traded_sex
			t.integer :partner_man_men
			t.integer :eligible_q_8_15
			t.integer :where_live
			t.string :where_live_other
			t.integer :willing_to_refer
			t.integer :matched_to_ego
			t.integer :eligible
			t.string :name_of_screener
			t.string :location_of_screening
			t.date :date_of_screening
			t.time :time_of_screening
			t.integer :referred_for_interview
			t.date :referred_appointment_date
			t.time :referred_appointment_time
			t.integer :reason_for_refusal
			t.string :reason_for_refusal_other

			t.timestamps
		end
	end
end
