class InterviewNote < ApplicationRecord
	validates_length_of :interview_notes, maximum: 65500
end
