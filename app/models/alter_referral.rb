class AlterReferral < ApplicationRecord

	belongs_to :alter_referral_sheet, counter_cache: true, optional: true

end
