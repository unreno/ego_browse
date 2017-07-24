class EligibilityScreeningsController < ApplicationController
  before_action :set_eligibility_screening, only: [:show, :edit, :update, :destroy]
#	before_action :require_creator, only: [:new,:create]
#	before_action :require_destroyer, only: [:edit,:update,:destroy]

	before_action :require_user_is_admin_if_csv, only: [:index]

  # GET /eligibility_screenings
  # GET /eligibility_screenings.json
  def index
    @eligibility_screenings = (params[:eligible_other_than_age])? 
			EligibilityScreening.eligible_other_than_age :
			EligibilityScreening.all
  end

  # GET /eligibility_screenings/1
  # GET /eligibility_screenings/1.json
  def show
  end

  # GET /eligibility_screenings/new
  def new
    @eligibility_screening = EligibilityScreening.new
  end

  # GET /eligibility_screenings/1/edit
  def edit
  end

  # POST /eligibility_screenings
  # POST /eligibility_screenings.json
  def create
    @eligibility_screening = EligibilityScreening.new(eligibility_screening_params)

    respond_to do |format|
      if @eligibility_screening.save
        format.html { redirect_to @eligibility_screening, notice: 'Eligibility screening was successfully created.' }
        format.json { render :show, status: :created, location: @eligibility_screening }
      else
        format.html { render :new }
        format.json { render json: @eligibility_screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eligibility_screenings/1
  # PATCH/PUT /eligibility_screenings/1.json
  def update
    respond_to do |format|
      if @eligibility_screening.update(eligibility_screening_params)
        format.html { redirect_to @eligibility_screening, notice: 'Eligibility screening was successfully updated.' }
        format.json { render :show, status: :ok, location: @eligibility_screening }
      else
        format.html { render :edit }
        format.json { render json: @eligibility_screening.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eligibility_screenings/1
  # DELETE /eligibility_screenings/1.json
  def destroy
    @eligibility_screening.destroy
    respond_to do |format|
      format.html { redirect_to eligibility_screenings_url, notice: 'Eligibility screening was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eligibility_screening
      @eligibility_screening = EligibilityScreening.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eligibility_screening_params
      params.require(:eligibility_screening).permit(:how_learned, :how_learned_other, :age, :age_other, :sex, :race, :race_other, :children, :seen_pcp, :marital, :tested_hiv, :tested_hiv_result, :partner_count, :injection_drugs, :partner_injection_drugs, :partner_noninjection_drugs, :partner_hiv_positive, :partner_other_partners, :partner_traded_sex, :partner_man_men, :eligible_q_9_16, :where_live, :where_live_other, :willing_to_refer, :matched_to_ego, :eligible, :name_of_screener, :location_of_screening, :date_of_screening, :time_of_screening, :referred_for_interview, :referred_appointment_date, :referred_appointment_time, :reason_for_refusal, :reason_for_refusal_other, :gender, :data_entry_name, :gender_at_birth)
    end
end
