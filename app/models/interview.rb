class Interview < ApplicationRecord

	self.table_name = "interview"
	belongs_to :study, foreign_key: :studyId, optional: true
	has_many :answers, foreign_key: :interviewId
	has_many :questions, through: :answers

end
