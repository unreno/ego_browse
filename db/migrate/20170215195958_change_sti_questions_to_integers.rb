class ChangeStiQuestionsToIntegers < ActiveRecord::Migration[5.0]
  def self.up
		change_table :sti_questionnaires do |t|
			t.change :stitest_a, :integer
			t.change :stitest_b, :integer
			t.change :stitest_c, :integer
			t.change :stitest_d, :integer
			t.change :stitest_e, :integer
			t.change :stitest_f, :integer
			t.change :stitest_g, :integer
			t.change :stitest_h, :integer
			t.change :stitest_i, :integer
			t.change :stitest_j, :integer
			t.change :stitest_last_never, :integer
			t.change :stitest_reason_a, :integer
			t.change :stitest_reason_b, :integer
			t.change :stitest_reason_c, :integer
			t.change :stitest_reason_d, :integer
			t.change :stitest_reason_e, :integer
			t.change :stitest_reason_f, :integer
			t.change :stitest_reason_g, :integer
			t.change :stitest_reason_h, :integer
			t.change :stitest_reason_i, :integer
			t.change :notest_reason_a, :integer
			t.change :notest_reason_b, :integer
			t.change :notest_reason_c, :integer
			t.change :notest_reason_d, :integer
			t.change :notest_reason_e, :integer
			t.change :notest_reason_f, :integer
			t.change :notest_reason_g, :integer
			t.change :notest_reason_h, :integer
			t.change :notest_reason_i, :integer
		end
  end
  def self.down
		change_table :sti_questionnaires do |t|
			t.change :stitest_a, :boolean
			t.change :stitest_b, :boolean
			t.change :stitest_c, :boolean
			t.change :stitest_d, :boolean
			t.change :stitest_e, :boolean
			t.change :stitest_f, :boolean
			t.change :stitest_g, :boolean
			t.change :stitest_h, :boolean
			t.change :stitest_i, :boolean
			t.change :stitest_j, :boolean
			t.change :stitest_last_never, :boolean
			t.change :stitest_reason_a, :boolean
			t.change :stitest_reason_b, :boolean
			t.change :stitest_reason_c, :boolean
			t.change :stitest_reason_d, :boolean
			t.change :stitest_reason_e, :boolean
			t.change :stitest_reason_f, :boolean
			t.change :stitest_reason_g, :boolean
			t.change :stitest_reason_h, :boolean
			t.change :stitest_reason_i, :boolean
			t.change :notest_reason_a, :boolean
			t.change :notest_reason_b, :boolean
			t.change :notest_reason_c, :boolean
			t.change :notest_reason_d, :boolean
			t.change :notest_reason_e, :boolean
			t.change :notest_reason_f, :boolean
			t.change :notest_reason_g, :boolean
			t.change :notest_reason_h, :boolean
			t.change :notest_reason_i, :boolean
		end
  end
end
