class Answer < ApplicationRecord
	self.table_name = "answer"
	belongs_to :question, foreign_key: :questionId
	belongs_to :interview, foreign_key: :interviewId
	belongs_to :study, foreign_key: :studyId
	belongs_to :alter1, foreign_key: :alterId1, class_name: :Alter
	belongs_to :alter2, foreign_key: :alterId2, class_name: :Alter

	after_find :decrypt_value
	def decrypt_value
		#	Added this condition so if use Answer.all.select(:id),
		#	or something other than value, it doesn't crash.
		if try(:value).present?
			self.value = MCRYPT.ivdecrypt(self.value) 
		end
	end

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
