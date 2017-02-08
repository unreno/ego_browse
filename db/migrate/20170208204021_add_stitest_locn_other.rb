class AddStitestLocnOther < ActiveRecord::Migration[5.0]
	def change
		add_column :sti_questionnaires, :stitest_locn_other, :string
	end
end
