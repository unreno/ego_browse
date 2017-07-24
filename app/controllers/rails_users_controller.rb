class RailsUsersController < ApplicationController

	before_action :require_admin
	skip_before_action :require_user_can_read

	def index
		@users = RailsUser.all
	end

end
