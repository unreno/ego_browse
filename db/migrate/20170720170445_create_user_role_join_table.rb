class CreateUserRoleJoinTable < ActiveRecord::Migration[5.0]
	def change
		create_join_table :rails_users, :rails_roles do |t|
			# t.index [:rails_user_id, :rails_role_id]
			t.index [:rails_role_id, :rails_user_id], unique: true
		end
	end
end
