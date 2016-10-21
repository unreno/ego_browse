class Answer < ApplicationRecord
	self.table_name = "answer"
	belongs_to :question, foreign_key: :questionId
	belongs_to :interview, foreign_key: :interviewId
	belongs_to :study, foreign_key: :studyId
	belongs_to :alter1, foreign_key: :alterId1, class_name: :Alter
	belongs_to :alter2, foreign_key: :alterId2, class_name: :Alter

	after_find :decrypt_value
	def decrypt_value
		self.value = MCRYPT.ivdecrypt(self.value)
	end

end
