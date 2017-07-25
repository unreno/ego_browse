class RailsUser < ApplicationRecord

	has_and_belongs_to_many :rails_roles,  ->{ distinct }

	validates_presence_of :password, on: :create
	validates :password, format: {
			with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)/,
			message: 'requires at least one lowercase and one uppercase letter, one number and one special character',
		},
		confirmation: true, allow_blank: true

	def role_names
		rails_roles.collect(&:name).uniq
	end

	acts_as_authentic do |c|
#		c.my_config_option = my_value
#		c.session_class = RailsUserSession
	end # the configuration block is optional

	def is_admin?
		(role_names & ['admin']).present?
	end

	def can_create?
		(role_names & ['create','admin']).present?
	end

	def can_read?
		(role_names & ['read','admin']).present?
	end

	def can_update?
		(role_names & ['update','admin']).present?
	end

	def can_destroy?
		(role_names & ['destroy','admin']).present?
	end

end
