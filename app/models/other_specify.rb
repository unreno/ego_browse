class OtherSpecify < ApplicationRecord
	self.table_name = "otherSpecify"
	belongs_to :interview, foreign_key: :interviewId
	belongs_to :alter, foreign_key: :alterId
end
