class Interview < ApplicationRecord
	self.table_name = "interview"
	belongs_to :study, foreign_key: :studyId
end
