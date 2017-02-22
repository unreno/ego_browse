class AlterReferralSheet < ApplicationRecord

	has_many :alter_referrals

	accepts_nested_attributes_for :alter_referrals, allow_destroy: true

end
