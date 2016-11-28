class CreateTestingFacilitations < ActiveRecord::Migration[5.0]
	def change
		create_table :testing_facilitations do |t|
			t.date :date_of_visit
			t.string :participant_id
			t.string :staff_person
			t.integer :agree_to_use_home_test_kit_at_site
			t.string :agree_to_use_home_test_kit_at_site_refusal_reason
			t.integer :agree_to_take_test_kit_home
			t.string :agree_to_take_test_kit_home_refusal_reason
			t.integer :agree_to_tell_result_of_home_test_kit
			t.string :agree_to_tell_result_of_home_test_kit_refusal_reason
			t.integer :result_of_home_test_kit
			t.integer :confirmatory_test_referred_location
			t.datetime :confirmatory_test_referred_appointment
			t.string :confirmatory_test_referred_location_other
			t.integer :indeterminate_test_option
			t.string :indeterminate_test_result
			t.string :indeterminate_test_referred_to
			t.integer :urine_to_test
			t.integer :urine_to_test_refusal_reason
			t.string :urine_to_test_refusal_reason_other
			t.integer :gonorrhea_result
			t.integer :chlamydia_result
			t.text :notes

			t.timestamps
		end
	end
end
