class AlterListsController < ApplicationController
	before_action :set_alter_list, only: [:show, :edit, :update, :destroy]
	before_action :require_admin, only: [:new,:create,:edit,:update,:destroy]

	# GET /alter_lists
	# GET /alter_lists.json
	def index
		@alter_lists = AlterList.all
	end

	# GET /alter_lists/1
	# GET /alter_lists/1.json
	def show
	end

	# GET /alter_lists/new
	def new
		@alter_list = AlterList.new
	end

	# GET /alter_lists/1/edit
	def edit
	end

	# POST /alter_lists
	# POST /alter_lists.json
	def create
		@alter_list = AlterList.new(alter_list_params)

		respond_to do |format|
			if @alter_list.save
				format.html { redirect_to @alter_list, notice: 'Alter list was successfully created.' }
				format.json { render :show, status: :created, location: @alter_list }
			else
				format.html { render :new }
				format.json { render json: @alter_list.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /alter_lists/1
	# PATCH/PUT /alter_lists/1.json
	def update
		respond_to do |format|
			if @alter_list.update(alter_list_params)
				format.html { redirect_to @alter_list, notice: 'Alter list was successfully updated.' }
				format.json { render :show, status: :ok, location: @alter_list }
			else
				format.html { render :edit }
				format.json { render json: @alter_list.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /alter_lists/1
	# DELETE /alter_lists/1.json
	def destroy
		@alter_list.destroy
		respond_to do |format|
			format.html { redirect_to alter_lists_url, notice: 'Alter list was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_alter_list
			@alter_list = AlterList.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def alter_list_params
			params.require(:alter_list).permit(:studyId, :name, :email, :ordering, :interviewerId)
		end
end
