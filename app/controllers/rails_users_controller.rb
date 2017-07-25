class RailsUsersController < ApplicationController
	before_action :set_rails_user, only: [:show, :edit, :update, :destroy]
	before_action :require_admin
	skip_before_action :require_user_can_read

	def index
		@rails_users = RailsUser.all
	end

	def new
		@rails_user = RailsUser.new
	end

	def create
		@rails_user = RailsUser.new(rails_user_params)

		respond_to do |format|
			if @rails_user.save
				format.html { redirect_to @rails_user, notice: 'User was successfully created.' }
				format.json { render :show, status: :created, location: @rails_user }
			else
				format.html { render :new }
				format.json { render json: @rails_user.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @rails_user.update(rails_user_params)
				format.html { redirect_to @rails_user, notice: 'User was successfully updated.' }
				format.json { render :show, status: :ok, location: @rails_user }
			else
				format.html { render :edit }
				format.json { render json: @rails_user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@rails_user.destroy
		respond_to do |format|
			format.html { redirect_to rails_users_url, notice: 'User was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private

		# Use callbacks to share common setup or constraints between actions.
		def set_rails_user
			@rails_user = RailsUser.find(params[:id])
		end
		# Never trust parameters from the scary internet, only allow the white list through.
		def rails_user_params
			params.require(:rails_user).permit(:login,:password,:password_confirmation)
		end
end
