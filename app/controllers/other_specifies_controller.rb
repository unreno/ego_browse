class OtherSpecifiesController < ApplicationController
  before_action :set_other_specify, only: [:show, :edit, :update, :destroy]

  # GET /other_specifies
  # GET /other_specifies.json
  def index
    @other_specifies = OtherSpecify.all
  end

  # GET /other_specifies/1
  # GET /other_specifies/1.json
  def show
  end

  # GET /other_specifies/new
  def new
    @other_specify = OtherSpecify.new
  end

  # GET /other_specifies/1/edit
  def edit
  end

  # POST /other_specifies
  # POST /other_specifies.json
  def create
    @other_specify = OtherSpecify.new(other_specify_params)

    respond_to do |format|
      if @other_specify.save
        format.html { redirect_to @other_specify, notice: 'Other specify was successfully created.' }
        format.json { render :show, status: :created, location: @other_specify }
      else
        format.html { render :new }
        format.json { render json: @other_specify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /other_specifies/1
  # PATCH/PUT /other_specifies/1.json
  def update
    respond_to do |format|
      if @other_specify.update(other_specify_params)
        format.html { redirect_to @other_specify, notice: 'Other specify was successfully updated.' }
        format.json { render :show, status: :ok, location: @other_specify }
      else
        format.html { render :edit }
        format.json { render json: @other_specify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /other_specifies/1
  # DELETE /other_specifies/1.json
  def destroy
    @other_specify.destroy
    respond_to do |format|
      format.html { redirect_to other_specifies_url, notice: 'Other specify was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_specify
      @other_specify = OtherSpecify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def other_specify_params
      params.require(:other_specify).permit(:optionId, :interviewId, :value, :alterId)
    end
end
