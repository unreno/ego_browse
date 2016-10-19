class AlterPromptsController < ApplicationController
	before_action :set_alter_prompt, only: [:show, :edit, :update, :destroy]

	# GET /alter_prompts
	# GET /alter_prompts.json
	def index
		@alter_prompts = AlterPrompt.all
	end

	# GET /alter_prompts/1
	# GET /alter_prompts/1.json
	def show
	end

	# GET /alter_prompts/new
	def new
		@alter_prompt = AlterPrompt.new
	end

	# GET /alter_prompts/1/edit
	def edit
	end

	# POST /alter_prompts
	# POST /alter_prompts.json
	def create
		@alter_prompt = AlterPrompt.new(alter_prompt_params)

		respond_to do |format|
			if @alter_prompt.save
				format.html { redirect_to @alter_prompt, notice: 'Alter prompt was successfully created.' }
				format.json { render :show, status: :created, location: @alter_prompt }
			else
				format.html { render :new }
				format.json { render json: @alter_prompt.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /alter_prompts/1
	# PATCH/PUT /alter_prompts/1.json
	def update
		respond_to do |format|
			if @alter_prompt.update(alter_prompt_params)
				format.html { redirect_to @alter_prompt, notice: 'Alter prompt was successfully updated.' }
				format.json { render :show, status: :ok, location: @alter_prompt }
			else
				format.html { render :edit }
				format.json { render json: @alter_prompt.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /alter_prompts/1
	# DELETE /alter_prompts/1.json
	def destroy
		@alter_prompt.destroy
		respond_to do |format|
			format.html { redirect_to alter_prompts_url, notice: 'Alter prompt was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_alter_prompt
			@alter_prompt = AlterPrompt.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def alter_prompt_params
			params.require(:alter_prompt).permit(:studyId, :afterAltersEntered, :display)
		end
end
