class StiQuestionnairesController < ApplicationController
	before_action :set_sti_questionnaire, only: [:show, :edit, :update, :destroy]
	skip_before_action :require_user_can_read, only: [:index]
	before_action :require_user_is_admin_if_csv, only: [:index]

	# GET /sti_questionnaires
	# GET /sti_questionnaires.json
	def index
		@sti_questionnaires = StiQuestionnaire.order(:participant_id)
	end

	# GET /sti_questionnaires/1
	# GET /sti_questionnaires/1.json
	def show
	end

	# GET /sti_questionnaires/new
	def new
		@sti_questionnaire = StiQuestionnaire.new(data_entry_name: current_user.login)
	end

	# GET /sti_questionnaires/1/edit
	def edit
		@sti_questionnaire.data_entry_name += ", #{current_user.login}"
	end

	# POST /sti_questionnaires
	# POST /sti_questionnaires.json
	def create
		@sti_questionnaire = StiQuestionnaire.new(sti_questionnaire_params)
		@sti_questionnaire.data_entry_name = current_user.login

		respond_to do |format|
			if @sti_questionnaire.save
				format.html { redirect_to @sti_questionnaire, notice: 'Sti questionnaire was successfully created.' }
				format.json { render :show, status: :created, location: @sti_questionnaire }
			else
				format.html { render :new }
				format.json { render json: @sti_questionnaire.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /sti_questionnaires/1
	# PATCH/PUT /sti_questionnaires/1.json
	def update
		p = sti_questionnaire_params
		p[:data_entry_name] = @sti_questionnaire.data_entry_name.to_s + ", #{current_user.login}"
		respond_to do |format|
			if @sti_questionnaire.update(p)
				format.html { redirect_to @sti_questionnaire, notice: 'Sti questionnaire was successfully updated.' }
				format.json { render :show, status: :ok, location: @sti_questionnaire }
			else
				format.html { render :edit }
				format.json { render json: @sti_questionnaire.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /sti_questionnaires/1
	# DELETE /sti_questionnaires/1.json
	def destroy
		@sti_questionnaire.destroy
		respond_to do |format|
			format.html { redirect_to sti_questionnaires_url, notice: 'Sti questionnaire was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_sti_questionnaire
			@sti_questionnaire = StiQuestionnaire.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def sti_questionnaire_params
			params.require(:sti_questionnaire).permit(:date_of_visit, :participant_id, :staff_person, :stitest_ev, :stitest_a, :stitest_b, :stitest_c, :stitest_d, :stitest_e, :stitest_f, :stitest_g, :stitest_h, :stitest_i, :stitest_j, :stitest_other, :stitest_last, :stitest_last_never, :stitest_reason_a, :stitest_reason_b, :stitest_reason_c, :stitest_reason_d, :stitest_reason_e, :stitest_reason_f, :stitest_reason_g, :stitest_reason_h, :stitest_reason_i, :stitest_reason_other, :stitest_locn, :stitest_rslt, :notest_reason_other, :notest_reason_a, :notest_reason_b, :notest_reason_c, :notest_reason_d, :notest_reason_e, :notest_reason_f, :notest_reason_g, :notest_reason_h, :notest_reason_i, :stitest_future, :stipercrisk, :stistigma, :stitest_locn_other)
		end
end
