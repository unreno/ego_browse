class Interviewer < ApplicationRecord


#	The interviewer table has an interviewerId field? Confused.


	belongs_to :study, foreign_key: :studyId, optional: true
	has_many :alter_lists, foreign_key: :interviewerId

end
