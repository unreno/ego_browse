class Alter < ApplicationRecord

	belongs_to :alter_list, foreign_key: :alterListId
	belongs_to :interview, foreign_key: :interviewId
	has_many  :notes, foreign_key: :alterId
	has_many  :other_specifies, foreign_key: :alterId

	after_find :decrypt_encrypted_fields
	def decrypt_encrypted_fields
		if try(:name).present?
			self.name = MCRYPT.mydecrypt(self.name)
		end
	end

end
