require 'base64'

MCRYPT = Mcrypt.new(:blowfish, :cbc, 
	YAML.load_file('config/mcrypt.yml')['encryption_key'] )

class Mcrypt

	#	iv = Initialization Vector

	def myencrypt(cleartext)
		if( cleartext.present? ) then
#			self.iv = 'testing1'	#	8 characters!
#			self.iv = (0...8).map { (65 + rand(26)).chr }.join
			self.iv = (0..7).map { (65 + rand(26)).chr }.join
			self.padding = :zeroes
#			Base64.encode64( self.iv + self.encrypt( cleartext ) )	#	adds a trailing newline?
			Base64.strict_encode64( self.iv + self.encrypt( cleartext ) )
		else
			""
		end
	end

	def mydecrypt(iv_ciphertext)
		if( iv_ciphertext.present? and iv_ciphertext.length > 8 ) then
			value = Base64.decode64(iv_ciphertext)
			self.iv = value[0..7]
			self.padding = false
			self.decrypt(value[8..-1]).squish
		else
			""
		end
	end

end
