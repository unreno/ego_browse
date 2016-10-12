class Interviewer < ApplicationRecord
#	self.table_name = "interviewers"


#	The interviewer table has an interviewerId field? Confused.


	belongs_to :study, foreign_key: :studyId
	has_many :alter_lists, foreign_key: :interviewerId
end
