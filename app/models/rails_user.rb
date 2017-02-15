class RailsUser < ApplicationRecord

	acts_as_authentic do |c|
#		c.my_config_option = my_value
#		c.session_class = RailsUserSession
	end # the configuration block is optional

	def is_admin?
		['admin','jake'].include?(login)
	end

	def can_create?
		['admin','dataentry','jake'].include?(login)
	end

	def can_destroy?
		['admin','jake'].include?(login)
	end

end
