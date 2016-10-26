class CreateEligibilityScreenings < ActiveRecord::Migration[5.0]
  def change
    create_table :eligibility_screenings do |t|
      t.string :how_learned, limit: 20
      t.string :how_learned_other
      t.string :age, limit: 5
      t.string :sex, limit: 5
      t.string :race, limit: 5
      t.string :race_other
      t.string :children, limit: 5
      t.string :seen_pcp, limit: 5
      t.string :marital, limit: 10
      t.string :tested_hiv, limit: 5
      t.string :tested_hiv_result, limit: 10
      t.string :partner_count, limit: 10
      t.string :injection_drugs, limit: 5
      t.string :partner_injection_drugs, limit: 5
      t.string :partner_noninjection_drugs, limit: 5
      t.string :partner_hiv_positive, limit: 10
      t.string :partner_other_partners, limit: 5
      t.string :partner_traded_sex, limit: 5
      t.string :partner_man_men, limit: 5
      t.string :eligible_q_8_15, limit: 5
      t.string :where_live, limit: 5
      t.string :where_live_other
      t.string :willing_to_refer, limit: 5
      t.string :matched_to_ego, limit: 5
      t.string :eligible, limit: 5
      t.string :name_of_screener
      t.string :location_of_screening
      t.date :date_of_screening
      t.time :time_of_screening
      t.string :referred_for_interview, limit: 5
      t.date :referred_appointment_date
      t.time :referred_appointment_time
      t.string :reason_for_refusal, limit: 50
      t.string :reason_for_refusal_other

      t.timestamps
    end
  end
end
