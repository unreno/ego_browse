class Note < ApplicationRecord
#	self.table_name = "notes"
	belongs_to :interview, foreign_key: :interviewId
	belongs_to :expression, foreign_key: :expressionId
	belongs_to :alter, foreign_key: :alterId
end
