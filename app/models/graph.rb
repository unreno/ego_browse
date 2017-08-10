class Graph < ApplicationRecord

	belongs_to :expression, foreign_key: :expressionId, optional: true
	belongs_to :interview, foreign_key: :interviewId, optional: true

end
