class RailsRole < ApplicationRecord
	has_and_belongs_to_many :rails_users, ->{ uniq }
end
