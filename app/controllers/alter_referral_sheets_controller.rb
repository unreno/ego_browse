class AlterReferralSheetsController < ApplicationController
	before_action :set_alter_referral_sheet, only: [:show, :edit, :update, :destroy]
#	before_action :require_admin, only: [:new,:create,:edit,:update,:destroy]

#	def row
#		render partial: 'alter_referral_form', locals: {f: form_for(AlterReferralSheet.new)}
#		render partial: 'alter_referral_form', locals: {
#			f: ActionView::Helpers::FormBuilder.new('alter_referral_sheet', AlterReferralSheet.new,
#				@template,{})
#		}
#	Can't really do "form_for" with ajax.  Need *_tag stuff.
#	end

	# GET /alter_referral_sheets
	# GET /alter_referral_sheets.json
	def index
		@alter_referral_sheets = AlterReferralSheet.all
	end

	# GET /alter_referral_sheets/1
	# GET /alter_referral_sheets/1.json
	def show
	end

	# GET /alter_referral_sheets/new
	def new
		@alter_referral_sheet = AlterReferralSheet.new
	end

	# GET /alter_referral_sheets/1/edit
	def edit
	end

	# POST /alter_referral_sheets
	# POST /alter_referral_sheets.json
	def create
		@alter_referral_sheet = AlterReferralSheet.new(alter_referral_sheet_params)

		respond_to do |format|
			if @alter_referral_sheet.save
				format.html { redirect_to @alter_referral_sheet, notice: 'Alter referral sheet was successfully created.' }
				format.json { render :show, status: :created, location: @alter_referral_sheet }
			else
				format.html { render :new }
				format.json { render json: @alter_referral_sheet.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /alter_referral_sheets/1
	# PATCH/PUT /alter_referral_sheets/1.json
	def update
		respond_to do |format|
			if @alter_referral_sheet.update(alter_referral_sheet_params)
				format.html { redirect_to @alter_referral_sheet, notice: 'Alter referral sheet was successfully updated.' }
				format.json { render :show, status: :ok, location: @alter_referral_sheet }
			else
				format.html { render :edit }
				format.json { render json: @alter_referral_sheet.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /alter_referral_sheets/1
	# DELETE /alter_referral_sheets/1.json
	def destroy
		@alter_referral_sheet.destroy
		respond_to do |format|
			format.html { redirect_to alter_referral_sheets_url, notice: 'Alter referral sheet was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_alter_referral_sheet
			@alter_referral_sheet = AlterReferralSheet.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def alter_referral_sheet_params
			params.require(:alter_referral_sheet).permit(:ego_id, :data_entry_name,
				:alter_referrals_attributes => [:id, :plan_to_refer, :name_cell,
					:date_of_alter_interview, :alter_id,
					:date_ego_notified, :date_ego_paid, :_destroy ]
			)
		end
end
