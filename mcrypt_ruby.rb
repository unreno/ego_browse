#!/usr/bin/env ruby


gem 'ruby-mcrypt'
require 'mcrypt'
require 'base64'


key = "One morning I shot an elephant in my pajamas."

m = Mcrypt.new(:blowfish, :cbc, key )
m.iv = "asdfqwer"
m.padding = :pkcs

puts m.encrypt("this is a test")
puts m.encrypt("this is a test")
puts m.encrypt("this is a test")
puts Base64.encode64(m.encrypt("this is a test"))
puts Base64.encode64(m.encrypt("this is another test"))


m = Mcrypt.new(:blowfish, :cbc, key )

value= Base64.decode64("RdP+m+0c1ZLCdsmNf2xTAw==")
m.iv = value[0..7]
puts m.decrypt(value[8..-1])

value= Base64.decode64("giAqZQr6nFdoFTRIyNl5pw==")
m.iv = value[0..7]
puts m.decrypt(value[8..-1])

value= Base64.decode64("YcvdLilfkJKireo/y2JjDQ==")
m.iv = value[0..7]
puts m.decrypt(value[8..-1])

value= Base64.decode64("kNRvgReZ1TpmFuUB18WXLw==")
m.iv = value[0..7]
puts m.decrypt(value[8..-1])

value= Base64.decode64("JqjY49dmXzTtT5PJ4EBX8Q==")
m.iv = value[0..7]
puts m.decrypt(value[8..-1])

