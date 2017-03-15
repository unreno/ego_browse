class EligibilityScreening < ApplicationRecord

	scope :eligible_other_than_age, ->{ 
		where( age: 0 )
		.where( gender_at_birth: 1 )
		.where( race: 1 )
		.where( self.arel_table[:tested_hiv].eq(0).or( self.arel_table[:tested_hiv_result].eq(1) ) )
		.where( self.arel_table[:partner_count].eq(1)
			.or( self.arel_table[:injection_drugs].eq(1) )
			.or( self.arel_table[:partner_injection_drugs].eq(1) )
			.or( self.arel_table[:partner_noninjection_drugs].eq(1) )
			.or( self.arel_table[:partner_hiv_positive].eq(1) )
			.or( self.arel_table[:partner_other_partners].eq(1) )
			.or( self.arel_table[:partner_traded_sex].eq(1) )
			.or( self.arel_table[:partner_man_men].eq(1) ) )
		.where( where_live: 1 )
		.where( willing_to_refer: 1 )
	}

end
