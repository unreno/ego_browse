class RailsUsersController < ApplicationController

	def index
		@users = RailsUser.all
	end

end
