class CreateTestingFacilitations < ActiveRecord::Migration[5.0]
	def change
		create_table :testing_facilitations do |t|
			t.date :date_of_visit
			t.string :participant_id
			t.string :staff_person
			t.string :agree_to_use_home_test_kit_at_site, limit: 10
			t.string :agree_to_use_home_test_kit_at_site_refusal_reason
			t.string :agree_to_take_test_kit_home, limit: 10
			t.string :agree_to_take_test_kit_home_refusal_reason
			t.string :agree_to_tell_result_of_home_test_kit, limit: 10
			t.string :agree_to_tell_result_of_home_test_kit_refusal_reason
			t.string :result_of_home_test_kit, limit: 25
			t.string :confirmatory_test_referred_location
			t.datetime :confirmatory_test_referred_appointment
			t.string :confirmatory_test_referred_location_other
			t.string :indeterminate_test_option, limit: 25
			t.string :indeterminate_test_result
			t.string :indeterminate_test_referred_to
			t.string :urine_to_test, limit: 10
			t.string :urine_to_test_refusal_reason
			t.string :urine_to_test_refusal_reason_other
			t.text :notes

			t.timestamps
		end
	end
end
