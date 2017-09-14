class InterviewNote < ApplicationRecord
	validates_length_of :interview_notes, maximum: 65500
	validates_length_of :ars_number, maximum: 10

	def self.attribute_names
		['participant_prefix','participant_suffix'] + super
	end

	def participant_prefix
		participant_id.to_s.split('_')[0]
	end

	def participant_suffix
		participant_id.to_s.split('_')[1]
	end

end
