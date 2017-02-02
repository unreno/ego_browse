class MatchedAltersController < ApplicationController
	before_action :set_matched_alter, only: [:show, :edit, :update, :destroy]
#	before_action :require_admin, only: [:new,:create,:edit,:update,:destroy]

	# GET /matched_alters
	# GET /matched_alters.json
	def index
		@matched_alters = MatchedAlter.all
	end

	# GET /matched_alters/1
	# GET /matched_alters/1.json
	def show
	end

#	# GET /matched_alters/new
#	def new
#		@matched_alter = MatchedAlter.new
#	end
#
#	# GET /matched_alters/1/edit
#	def edit
#	end
#
#	# POST /matched_alters
#	# POST /matched_alters.json
#	def create
#		@matched_alter = MatchedAlter.new(matched_alter_params)
#
#		respond_to do |format|
#			if @matched_alter.save
#				format.html { redirect_to @matched_alter, notice: 'Matched alter was successfully created.' }
#				format.json { render :show, status: :created, location: @matched_alter }
#			else
#				format.html { render :new }
#				format.json { render json: @matched_alter.errors, status: :unprocessable_entity }
#			end
#		end
#	end
#
#	# PATCH/PUT /matched_alters/1
#	# PATCH/PUT /matched_alters/1.json
#	def update
#		respond_to do |format|
#			if @matched_alter.update(matched_alter_params)
#				format.html { redirect_to @matched_alter, notice: 'Matched alter was successfully updated.' }
#				format.json { render :show, status: :ok, location: @matched_alter }
#			else
#				format.html { render :edit }
#				format.json { render json: @matched_alter.errors, status: :unprocessable_entity }
#			end
#		end
#	end
#
#	# DELETE /matched_alters/1
#	# DELETE /matched_alters/1.json
#	def destroy
#		@matched_alter.destroy
#		respond_to do |format|
#			format.html { redirect_to matched_alters_url, notice: 'Matched alter was successfully destroyed.' }
#			format.json { head :no_content }
#		end
#	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_matched_alter
			@matched_alter = MatchedAlter.find(params[:id])
		end

#		# Never trust parameters from the scary internet, only allow the white list through.
#		def matched_alter_params
#			params.require(:matched_alter).permit(:studyId, :alterId1, :alterId2, :matchedName)
#		end
end
