class MatchedAlter < ApplicationRecord

	self.table_name = "matchedAlters"
	belongs_to :study, foreign_key: :studyId
	belongs_to :alter1, foreign_key: :alterId1, class_name: :Alter
	belongs_to :alter2, foreign_key: :alterId2, class_name: :Alter

end
