class ChangeStitestLastToString < ActiveRecord::Migration[5.0]
	def change
		change_column :sti_questionnaires, :stitest_last, :string
	end
end
