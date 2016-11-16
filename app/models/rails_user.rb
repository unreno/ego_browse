class RailsUser < ApplicationRecord
#class User < ActiveRecord::Base
	acts_as_authentic do |c|
#		c.my_config_option = my_value
#		c.session_class = RailsUserSession
	end # the configuration block is optional
end



#	RailsUser.create(:login => 'jake', :password => 'password', :password_confirmation => 'password')
