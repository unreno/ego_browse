class CreateStiQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :sti_questionnaires do |t|
      t.date :date_of_visit
      t.string :participant_id
      t.string :staff_person
      t.integer :stitest_ev
      t.integer :stitest
      t.string :stitest_other
      t.date :stitest_last
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
      t.integer :stitest_rslt
      t.integer :notest_reason
      t.integer :stitest_future
      t.integer :stipercrisk
      t.integer :stistigma

      t.timestamps
    end
  end
end
