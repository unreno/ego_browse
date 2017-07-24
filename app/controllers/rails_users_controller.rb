class RailsUsersController < ApplicationController

	skip_before_action :require_user_can_read

	def index
		@users = RailsUser.all
	end

end
