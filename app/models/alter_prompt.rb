class AlterPrompt < ApplicationRecord

	self.table_name = "alterPrompt"
	belongs_to :study, foreign_key: :studyId, optional: true

end
