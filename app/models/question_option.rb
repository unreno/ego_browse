class QuestionOption < ApplicationRecord

	self.table_name = "questionOption"
	belongs_to :question, foreign_key: :questionId
	belongs_to :study, foreign_key: :studyId

end
