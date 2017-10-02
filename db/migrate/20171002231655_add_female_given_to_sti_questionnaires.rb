class AddFemaleGivenToStiQuestionnaires < ActiveRecord::Migration[5.1]
	def change
		add_column :sti_questionnaires, :female_given, :integer
	end
end
