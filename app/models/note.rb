class Note < ApplicationRecord

	belongs_to :interview, foreign_key: :interviewId, optional: true
	belongs_to :expression, foreign_key: :expressionId, optional: true
	belongs_to :alter, foreign_key: :alterId, optional: true

	after_find :decrypt_encrypted_fields

	def decrypt_encrypted_fields
		if try(:notes).present?
			self.notes = MCRYPT.mydecrypt(self.notes)
		end
	end

end
