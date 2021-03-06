class Answer < ApplicationRecord

	self.table_name = "answer"
	belongs_to :question, foreign_key: :questionId, optional: true
	belongs_to :interview, foreign_key: :interviewId, optional: true
	belongs_to :study, foreign_key: :studyId, optional: true
	belongs_to :alter1, foreign_key: :alterId1, class_name: :Alter, optional: true
	belongs_to :alter2, foreign_key: :alterId2, class_name: :Alter, optional: true

	after_find :decrypt_encrypted_fields
	def decrypt_encrypted_fields
		#	Added this condition so if use Answer.all.select(:id),
		#	or something other than value, it doesn't crash.
		if try(:value).present?
			self.value = MCRYPT.mydecrypt(self.value) 
		end
		if try(:otherSpecifyText).present?
			self.otherSpecifyText = MCRYPT.mydecrypt(self.otherSpecifyText) 
		end
	end

#	value is an QuestionOption id when answerType MULTIPLE_SELECTION

#	If answertype == 'MULTIPLE_SELECTION'
#	then value(s) is/are QuestionOption.find( value.split(/,/) ).(&:value)

#	QuestionOption.find(value.split(/,/))

	def option_names
		if( answerType == 'MULTIPLE_SELECTION' ) ; then
			QuestionOption.where(:id => value.split(/,/)).collect(&:name)
		end
	end

	def option_values
		if( answerType == 'MULTIPLE_SELECTION' ) ; then
			QuestionOption.where(:id => value.split(/,/)).collect(&:value)
		end
	end

end
