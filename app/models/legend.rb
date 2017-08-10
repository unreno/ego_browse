class Legend < ApplicationRecord

	self.table_name = "legend"
	belongs_to :question, foreign_key: :questionId, optional: true
	belongs_to :study, foreign_key: :studyId, optional: true

end
