class Note < ApplicationRecord
#	self.table_name = "notes"
	belongs_to :interview, foreign_key: :interviewId
	belongs_to :expression, foreign_key: :expressionId
	belongs_to :alter, foreign_key: :alterId

	after_find :decrypt_encrypted_fields

	def decrypt_encrypted_fields
		if try(:notes).present?
			self.notes = MCRYPT.mydecrypt(self.notes)
		end
	end

end
