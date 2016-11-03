require 'base64'

MCRYPT = Mcrypt.new(:blowfish, :cbc, 
	YAML.load_file('config/mcrypt.yml')['encryption_key'] )

class Mcrypt

	def ivdecrypt(iv_ciphertext)
		if( iv_ciphertext.present? and iv_ciphertext.length > 8 ) then
			value = Base64.decode64(iv_ciphertext)
			self.iv = value[0..7]
			self.decrypt(value[8..-1]).squish
		else
			""
		end
	end

end
