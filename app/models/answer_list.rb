class AnswerList < ApplicationRecord

	self.table_name = "answerList"
	belongs_to :study, foreign_key: :studyId

end
