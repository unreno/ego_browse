class RailsRolesController < ApplicationController
	before_action :require_admin
	skip_before_action :require_user_can_update
	skip_before_action :require_user_can_destroy
	before_action :set_rails_user
	before_action :set_rails_role

	def update
		@rails_user.rails_roles << @rails_role
		flash[:notice] = 'User was successfully updated.'
		redirect_to @rails_user
	end

	def destroy
		@rails_user.rails_roles.delete @rails_role
		flash[:notice] = 'User was successfully updated.'
		redirect_to @rails_user
	end

protected

	# Use callbacks to share common setup or constraints between actions.

	def set_rails_user
		@rails_user = RailsUser.find(params[:rails_user_id])
	end

	def set_rails_role
		@rails_role = RailsRole.find(params[:id])
	end

end
