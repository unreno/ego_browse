class StiQuestionnaire < ApplicationRecord

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
