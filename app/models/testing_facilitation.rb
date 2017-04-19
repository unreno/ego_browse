class TestingFacilitation < ApplicationRecord
	validates_length_of :notes, maximum: 65500
end
