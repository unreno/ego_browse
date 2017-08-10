class OtherSpecify < ApplicationRecord

	self.table_name = "otherSpecify"
	belongs_to :interview, foreign_key: :interviewId, optional: true
	belongs_to :alter, foreign_key: :alterId, optional: true

end
