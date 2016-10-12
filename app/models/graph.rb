class Graph < ApplicationRecord
#	self.table_name = "graphs"
	belongs_to :expression, foreign_key: :expressionId
	belongs_to :interview, foreign_key: :interviewId
end
