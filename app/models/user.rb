class User < ApplicationRecord
	self.table_name = "user"
	belongs_to :study, foreign_key: :userId

	after_find :decrypt_name
	after_find :decrypt_email

	def decrypt_name
		self.name = MCRYPT.ivdecrypt(self.name)
	end

	def decrypt_email
		self.email = MCRYPT.ivdecrypt(self.email)
	end

end
