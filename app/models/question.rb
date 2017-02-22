class Question < ApplicationRecord

	self.table_name = "question"
	belongs_to :study, foreign_key: :studyId
	has_many :answers, foreign_key: :questionId
	has_many :expressions, foreign_key: :questionId
	has_many :legends, foreign_key: :questionId
	has_many :question_options, foreign_key: :questionId

end
