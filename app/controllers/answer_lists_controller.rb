class AnswerListsController < ApplicationController
  before_action :set_answer_list, only: [:show, :edit, :update, :destroy]

  # GET /answer_lists
  # GET /answer_lists.json
  def index
    @answer_lists = AnswerList.all
  end

  # GET /answer_lists/1
  # GET /answer_lists/1.json
  def show
  end

  # GET /answer_lists/new
  def new
    @answer_list = AnswerList.new
  end

  # GET /answer_lists/1/edit
  def edit
  end

  # POST /answer_lists
  # POST /answer_lists.json
  def create
    @answer_list = AnswerList.new(answer_list_params)

    respond_to do |format|
      if @answer_list.save
        format.html { redirect_to @answer_list, notice: 'Answer list was successfully created.' }
        format.json { render :show, status: :created, location: @answer_list }
      else
        format.html { render :new }
        format.json { render json: @answer_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_lists/1
  # PATCH/PUT /answer_lists/1.json
  def update
    respond_to do |format|
      if @answer_list.update(answer_list_params)
        format.html { redirect_to @answer_list, notice: 'Answer list was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_list }
      else
        format.html { render :edit }
        format.json { render json: @answer_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_lists/1
  # DELETE /answer_lists/1.json
  def destroy
    @answer_list.destroy
    respond_to do |format|
      format.html { redirect_to answer_lists_url, notice: 'Answer list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_list
      @answer_list = AnswerList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_list_params
      params.require(:answer_list).permit(:active, :listName, :studyId, :listOptionNames)
    end
end
