class ContactInformationsController < ApplicationController
  before_action :set_contact_information, only: [:show, :edit, :update, :destroy]
	before_action :require_admin, only: [:new,:create,:edit,:update,:destroy]

  # GET /contact_informations
  # GET /contact_informations.json
  def index
    @contact_informations = ContactInformation.all
  end

  # GET /contact_informations/1
  # GET /contact_informations/1.json
  def show
  end

  # GET /contact_informations/new
  def new
    @contact_information = ContactInformation.new
  end

  # GET /contact_informations/1/edit
  def edit
  end

  # POST /contact_informations
  # POST /contact_informations.json
  def create
    @contact_information = ContactInformation.new(contact_information_params)

    respond_to do |format|
      if @contact_information.save
        format.html { redirect_to @contact_information, notice: 'Contact information was successfully created.' }
        format.json { render :show, status: :created, location: @contact_information }
      else
        format.html { render :new }
        format.json { render json: @contact_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_informations/1
  # PATCH/PUT /contact_informations/1.json
  def update
    respond_to do |format|
      if @contact_information.update(contact_information_params)
        format.html { redirect_to @contact_information, notice: 'Contact information was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_information }
      else
        format.html { render :edit }
        format.json { render json: @contact_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_informations/1
  # DELETE /contact_informations/1.json
  def destroy
    @contact_information.destroy
    respond_to do |format|
      format.html { redirect_to contact_informations_url, notice: 'Contact information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_information
      @contact_information = ContactInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_information_params
      params.require(:contact_information).permit(:data_entry_name, :first_name, :middle_name, :last_name, :alternate_names, :dob, :primary_phone_number, :primary_phone_type, :primary_phone_message, :primary_phone_text, :secondary_phone_number, :secondary_phone_type, :secondary_phone_message, :secondary_phone_text, :tertiary_phone_number, :tertiary_phone_type, :tertiary_phone_message, :tertiary_phone_text, :primary_address, :primary_city, :primary_state, :primary_zip, :secondary_address, :secondary_city, :secondary_state, :secondary_zip, :ok_to_mail_negative_test_result, :email, :other_person_relationship, :other_person_phone, :other_person_ok_to_pass_message, :referral_source, :height, :build, :age, :race, :eye_color, :hair, :other_identifying_marks)
    end
end
