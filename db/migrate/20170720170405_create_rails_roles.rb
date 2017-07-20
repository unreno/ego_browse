class CreateRailsRoles < ActiveRecord::Migration[5.0]
	def change
		create_table :rails_roles do |t|
			t.string :name

			t.timestamps
		end
	end
end
