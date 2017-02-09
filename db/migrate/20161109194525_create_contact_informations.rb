class CreateContactInformations < ActiveRecord::Migration[5.0]
	def change
		create_table :contact_informations do |t|
			t.string :data_entry_name
			t.string :first_name
			t.string :middle_name
			t.string :last_name
			t.string :alternate_names
			t.string :dob
			t.string :primary_phone_number
			t.string :primary_phone_type, limit: 5
			t.string :primary_phone_message, limit: 1
			t.string :primary_phone_text, limit: 1
			t.string :secondary_phone_number
			t.string :secondary_phone_type, limit: 5
			t.string :secondary_phone_message, limit: 1
			t.string :secondary_phone_text, limit: 1
			t.string :tertiary_phone_number
			t.string :tertiary_phone_type, limit: 5
			t.string :tertiary_phone_message, limit: 1
			t.string :tertiary_phone_text, limit: 1
			t.string :primary_address
			t.string :primary_city
			t.string :primary_state, limit: 5
			t.string :primary_zip, limit: 10
			t.string :secondary_address
			t.string :secondary_city
			t.string :secondary_state, limit: 5
			t.string :secondary_zip, limit: 10
			t.string :ok_to_mail_negative_test_result, limit: 1
			t.string :email
			t.string :other_person_relationship
			t.string :other_person_phone
			t.string :other_person_ok_to_pass_message, limit: 1
			t.string :referral_source
			t.string :height
			t.string :build
			t.integer :age
			t.string :race
			t.string :eye_color
			t.string :hair
			t.string :other_identifying_marks

			t.timestamps
		end
	end
end
