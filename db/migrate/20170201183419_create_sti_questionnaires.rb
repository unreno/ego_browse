class CreateStiQuestionnaires < ActiveRecord::Migration[5.0]
	def change
		create_table :sti_questionnaires do |t|
			t.string :data_entry_name
			t.string :date_of_visit
			t.string :participant_id
			t.string :staff_person
			t.integer :stitest_ev
			t.boolean :stitest_a
			t.boolean :stitest_b
			t.boolean :stitest_c
			t.boolean :stitest_d
			t.boolean :stitest_e
			t.boolean :stitest_f
			t.boolean :stitest_g
			t.boolean :stitest_h
			t.boolean :stitest_i
			t.boolean :stitest_j
			t.string :stitest_other
			t.string :stitest_last
			t.boolean :stitest_last_never
			t.boolean :stitest_reason_a
			t.boolean :stitest_reason_b
			t.boolean :stitest_reason_c
			t.boolean :stitest_reason_d
			t.boolean :stitest_reason_e
			t.boolean :stitest_reason_f
			t.boolean :stitest_reason_g
			t.boolean :stitest_reason_h
			t.boolean :stitest_reason_i
			t.string :stitest_reason_other
			t.integer :stitest_locn
			t.string :stitest_locn_other
			t.integer :stitest_rslt
			t.boolean :notest_reason_a
			t.boolean :notest_reason_b
			t.boolean :notest_reason_c
			t.boolean :notest_reason_d
			t.boolean :notest_reason_e
			t.boolean :notest_reason_f
			t.boolean :notest_reason_g
			t.boolean :notest_reason_h
			t.boolean :notest_reason_i
			t.string :notest_reason_other
			t.integer :stitest_future
			t.integer :stipercrisk
			t.integer :stistigma

			t.timestamps
		end
	end
end
