class AlterList < ApplicationRecord

	self.table_name = "alterList"
	belongs_to :study, foreign_key: :studyId, optional: true
	belongs_to :interviewer, foreign_key: :interviewerId, optional: true

end
