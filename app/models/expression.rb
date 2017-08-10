class Expression < ApplicationRecord

	self.table_name = "expression"

	#	rails tries to use the column "type" for Single Table Inheritance
	#	Need to force rails to ignore it.
	self.inheritance_column = nil

	belongs_to :study, foreign_key: :studyId, optional: true
	belongs_to :question, foreign_key: :questionId, optional: true
	has_many :notes, foreign_key: :expressionId
	has_many :graphs, foreign_key: :expressionId

end
