class TestingFacilitationsController < ApplicationController
	before_action :set_testing_facilitation, only: [:show, :edit, :update, :destroy]
	skip_before_action :require_user_can_read, only: [:index]
	before_action :require_user_is_admin_if_csv, only: [:index]

	# GET /testing_facilitations
	# GET /testing_facilitations.json
	def index
		@testing_facilitations = TestingFacilitation.order(:participant_id)
	end

	# GET /testing_facilitations/1
	# GET /testing_facilitations/1.json
	def show
	end

	# GET /testing_facilitations/new
	def new
		@testing_facilitation = TestingFacilitation.new(data_entry_name: current_user.login)
	end

	# GET /testing_facilitations/1/edit
	def edit
		@testing_facilitation.data_entry_name += ", #{current_user.login}"
	end

	# POST /testing_facilitations
	# POST /testing_facilitations.json
	def create
		@testing_facilitation = TestingFacilitation.new(testing_facilitation_params)
		@testing_facilitation.data_entry_name = current_user.login

		respond_to do |format|
			if @testing_facilitation.save
				format.html { redirect_to @testing_facilitation, notice: 'Testing facilitation was successfully created.' }
				format.json { render :show, status: :created, location: @testing_facilitation }
			else
				format.html { render :new }
				format.json { render json: @testing_facilitation.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /testing_facilitations/1
	# PATCH/PUT /testing_facilitations/1.json
	def update
		p = testing_facilitation_params
		p[:data_entry_name] = @testing_facilitation.data_entry_name.to_s + ", #{current_user.login}"
		respond_to do |format|
			if @testing_facilitation.update(p)
				format.html { redirect_to @testing_facilitation, notice: 'Testing facilitation was successfully updated.' }
				format.json { render :show, status: :ok, location: @testing_facilitation }
			else
				format.html { render :edit }
				format.json { render json: @testing_facilitation.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /testing_facilitations/1
	# DELETE /testing_facilitations/1.json
	def destroy
		@testing_facilitation.destroy
		respond_to do |format|
			format.html { redirect_to testing_facilitations_url, notice: 'Testing facilitation was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_testing_facilitation
			@testing_facilitation = TestingFacilitation.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def testing_facilitation_params
			params.require(:testing_facilitation).permit(:date_of_visit, :participant_id, :staff_person, :agree_to_use_home_test_kit_at_site, :agree_to_use_home_test_kit_at_site_refusal_reason, :agree_to_take_test_kit_home, :agree_to_take_test_kit_home_refusal_reason, :agree_to_tell_result_of_home_test_kit, :agree_to_tell_result_of_home_test_kit_refusal_reason, :result_of_home_test_kit, :confirmatory_test_referred_location, :confirmatory_test_referred_appointment, :confirmatory_test_referred_location_other, :indeterminate_test_option, :indeterminate_test_result, :indeterminate_test_referred_to, :urine_to_test, :urine_to_test_refusal_reason, :urine_to_test_refusal_reason_other, :notes, :gonorrhea_result, :chlamydia_result
)
		end
end
