class Expression < ApplicationRecord
	self.table_name = "expression"

	#	rails tries to use the column "type" for Single Table Inheritance
	#	Need to force rails to ignore it.
	self.inheritance_column = nil
end
