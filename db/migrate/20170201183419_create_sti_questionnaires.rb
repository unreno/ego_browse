class CreateStiQuestionnaires < ActiveRecord::Migration[5.0]
	def change
		create_table :sti_questionnaires do |t|
			t.string :data_entry_name
			t.string :date_of_visit
			t.string :participant_id
			t.string :staff_person
			t.integer :stitest_ev
			t.integer :stitest_a
			t.integer :stitest_b
			t.integer :stitest_c
			t.integer :stitest_d
			t.integer :stitest_e
			t.integer :stitest_f
			t.integer :stitest_g
			t.integer :stitest_h
			t.integer :stitest_i
			t.integer :stitest_j
			t.string :stitest_other
			t.string :stitest_last
			t.integer :stitest_last_never
			t.integer :stitest_reason_a
			t.integer :stitest_reason_b
			t.integer :stitest_reason_c
			t.integer :stitest_reason_d
			t.integer :stitest_reason_e
			t.integer :stitest_reason_f
			t.integer :stitest_reason_g
			t.integer :stitest_reason_h
			t.integer :stitest_reason_i
			t.string :stitest_reason_other
			t.integer :stitest_locn
			t.string :stitest_locn_other
			t.integer :stitest_rslt
			t.integer :notest_reason_a
			t.integer :notest_reason_b
			t.integer :notest_reason_c
			t.integer :notest_reason_d
			t.integer :notest_reason_e
			t.integer :notest_reason_f
			t.integer :notest_reason_g
			t.integer :notest_reason_h
			t.integer :notest_reason_i
			t.string :notest_reason_other
			t.integer :stitest_future
			t.integer :stipercrisk
			t.integer :stistigma

			t.timestamps
		end
	end
end
