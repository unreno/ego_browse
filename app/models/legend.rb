class Legend < ApplicationRecord

	self.table_name = "legend"
	belongs_to :question, foreign_key: :questionId
	belongs_to :study, foreign_key: :studyId

end
