class AltersController < ApplicationController
	before_action :set_alter, only: [:show, :edit, :update, :destroy]

	# GET /alters
	# GET /alters.json
	def index
		@alters = Alter.all
	end

	# GET /alters/1
	# GET /alters/1.json
	def show
	end

	# GET /alters/new
	def new
		@alter = Alter.new
	end

	# GET /alters/1/edit
	def edit
	end

	# POST /alters
	# POST /alters.json
	def create
		@alter = Alter.new(alter_params)

		respond_to do |format|
			if @alter.save
				format.html { redirect_to @alter, notice: 'Alter was successfully created.' }
				format.json { render :show, status: :created, location: @alter }
			else
				format.html { render :new }
				format.json { render json: @alter.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /alters/1
	# PATCH/PUT /alters/1.json
	def update
		respond_to do |format|
			if @alter.update(alter_params)
				format.html { redirect_to @alter, notice: 'Alter was successfully updated.' }
				format.json { render :show, status: :ok, location: @alter }
			else
				format.html { render :edit }
				format.json { render json: @alter.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /alters/1
	# DELETE /alters/1.json
	def destroy
		@alter.destroy
		respond_to do |format|
			format.html { redirect_to alters_url, notice: 'Alter was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_alter
			@alter = Alter.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def alter_params
			params.require(:alter).permit(:studyId, :active, :ordering, :name, :interviewId, :alterListId)
		end
end
