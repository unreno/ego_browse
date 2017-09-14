class InterviewNotesController < ApplicationController
  before_action :set_interview_note, only: [:show, :edit, :update, :destroy]
	skip_before_action :require_user_can_read, only: [:index]
	before_action :require_user_is_admin_if_csv, only: [:index]

  # GET /interview_notes
  # GET /interview_notes.json
  def index
    @interview_notes = InterviewNote.order(:participant_id)
    @interview_notes = @interview_notes.where(
			InterviewNote.arel_table[:participant_id].matches(params[:prefix] + "%") ) if params[:prefix].present?
  end

  # GET /interview_notes/1
  # GET /interview_notes/1.json
  def show
  end

  # GET /interview_notes/new
  def new
    @interview_note = InterviewNote.new(data_entry_name: current_user.login)
  end

  # GET /interview_notes/1/edit
  def edit
		@interview_note.data_entry_name += ", #{current_user.login}"
  end

  # POST /interview_notes
  # POST /interview_notes.json
  def create
    @interview_note = InterviewNote.new(interview_note_params)
		@interview_note.data_entry_name = current_user.login

    respond_to do |format|
      if @interview_note.save
        format.html { redirect_to @interview_note, notice: 'Interview note was successfully created.' }
        format.json { render :show, status: :created, location: @interview_note }
      else
        format.html { render :new }
        format.json { render json: @interview_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interview_notes/1
  # PATCH/PUT /interview_notes/1.json
  def update
		p = interview_note_params
		p[:data_entry_name] = @interview_note.data_entry_name.to_s + ", #{current_user.login}"
    respond_to do |format|
      if @interview_note.update(p)
        format.html { redirect_to @interview_note, notice: 'Interview note was successfully updated.' }
        format.json { render :show, status: :ok, location: @interview_note }
      else
        format.html { render :edit }
        format.json { render json: @interview_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interview_notes/1
  # DELETE /interview_notes/1.json
  def destroy
    @interview_note.destroy
    respond_to do |format|
      format.html { redirect_to interview_notes_url, notice: 'Interview note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interview_note
      @interview_note = InterviewNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interview_note_params
      params.require(:interview_note).permit(:participant_id, :interview_date, :interview_notes, :process_notes, :interviewer, :ars_number )
    end
end
