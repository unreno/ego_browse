class RailsUser < ApplicationRecord

	has_and_belongs_to_many :rails_roles,  ->{ distinct }

	validates :password, format: {
			with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)/,
			message: 'requires at least one lowercase and one uppercase letter, one number and one special character',
		},
		confirmation: true

	def role_names
		rails_roles.collect(&:name).uniq
	end

	acts_as_authentic do |c|
#		c.my_config_option = my_value
#		c.session_class = RailsUserSession
	end # the configuration block is optional

	def is_admin?
#		['admin','jake'].include?(login)
#		role_names.include?('admin')
		(role_names & ['admin']).present?
	end

	def can_create?
#		['admin','dataentry','jake'].include?(login)
		(role_names & ['dataentry','admin']).present?
	end

	def can_destroy?
#		['admin','jake'].include?(login)
		(role_names & ['admin']).present?
	end

end
