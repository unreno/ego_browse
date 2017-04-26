class TestingFacilitation < ApplicationRecord
	validates_length_of :notes, maximum: 65500

	def self.attribute_names
		['participant_prefix','participant_suffix'] + super
	end

	def participant_prefix
		participant_id.split('_')[0]
	end

	def participant_suffix
		participant_id.split('_')[1]
	end

end
