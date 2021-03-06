class User < ApplicationRecord

	self.table_name = "user"
	belongs_to :study, foreign_key: :userId, optional: true

	after_find :decrypt_encrypted_fields

	def decrypt_encrypted_fields
		if try(:name).present?
			self.name = MCRYPT.mydecrypt(self.name)
		end
		if try(:email).present?
			self.email = MCRYPT.mydecrypt(self.email)
		end
	end

end
