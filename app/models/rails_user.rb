class RailsUser < ApplicationRecord
	acts_as_authentic do |c|
#		c.my_config_option = my_value
#		c.session_class = RailsUserSession
	end # the configuration block is optional
end

#	EGOWeb seems to lock the database so can't even connect?

#	RailsUser.create(:login => 'jake', :password => 'password', :password_confirmation => 'password')

