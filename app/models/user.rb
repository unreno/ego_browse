class User < ApplicationRecord
	self.table_name = "user"
	belongs_to :study, foreign_key: :userId
end
