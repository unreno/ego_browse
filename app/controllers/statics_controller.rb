class StaticsController < ApplicationController

	def demographic_counts
		@studies = Study.all.collect{|s|s.demographics_hash}
	end

	#	try to move this into the model?

	#	NOTE EGO race includes any of African, Caribean, Black (other), Black (or AA)
	def black_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:name] = study.name
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_raw_demographics
				.select{|d|
					(d[:race] & ["African", "Afro-Caribbean", "Black or African-American", "Black, other"]).length > 0
				}
				.collect{|d| d[:assoc] }.flatten.singularize
			@studies << s
		end
		render :demographic_counts
	end

	#	NOTE EGO Race NOT IN African, Caribean, Black (other), Black (or AA)
	#	NOTE EGO Race in Latino OR EGO hispanicity == YES
	def latina_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:name] = study.name
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_raw_demographics
				.select{|d|
					( (d[:race] & ["African", "Afro-Caribbean",
						"Black or African-American", "Black, other"]).length == 0 ) &&
					( d[:race].include?("Latino or Hispanic (Example: Mexican)" ) ||
						( d[:hisplat] == ["Yes"] )
					)
				}
				.collect{|d| d[:assoc] }.flatten.singularize
			@studies << s
		end
		render :demographic_counts
	end

	#	NOTE EGO Race NOT IN African, Caribean, Black (other), Black (or AA), Latino
	#	NOTE EGO hispanicity NOT YES
	#	NOTE EGO gender = transfemale or sex == Male
	def trans_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:name] = study.name
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_raw_demographics
				.select{|d|
					( ( (d[:race] & ["African", "Afro-Caribbean", "Black or African-American",
						"Black, other", "Latino or Hispanic (Example: Mexican)" ]).length == 0 ) &&
						( d[:hisplat] != ["Yes"] ) &&
						( ( d[:gender] == ["Transfemale"] ) ||
							( d[:sex] == ["Male"] ) )
					)
				}
				.collect{|d| d[:assoc] }.flatten.singularize
			@studies << s
		end
		render :demographic_counts
	end

	#	NOTE EGO Race NOT IN African, Caribean, Black (other), Black (or AA), Latino
	#	NOTE EGO hispanicity NOT YES

	#	NOTE *NOT* EGO gender = transfemale or sex == Male

	def leftover_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:name] = study.name
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_raw_demographics
				.select{|d|
					( ( (d[:race] & ["African", "Afro-Caribbean", "Black or African-American",
						"Black, other", "Latino or Hispanic (Example: Mexican)" ]).length == 0 ) &&
						( d[:hisplat] != ["Yes"] ) &&
						( d[:gender] != ["Transfemale"] ) &&
						( d[:sex] != ["Male"] )
					)
				}
				.collect{|d| d[:assoc] }.flatten.singularize
			@studies << s
		end
		render :demographic_counts
	end

#	same filters as above
#	testing facilitation and ego web
#	STI COUNTS
#Rows: Study 1 (AA), 2 (Latina), 3 (trans)
#Columns: # agreed to test for hiv, # told results ov HIV, HIV+, # HIV-, # HIV Ind, # tested for chlamydia / gonorrhea, # Gonorrhea+, # Chlamydia+

	def sti_counts
		studies = Study.all.collect{|s|s.nested_raw_demographics}
		@ego_ids = {}
		@tfs = {}
		@ego_ids['AA'] = studies.flatten.select{|d|
			(d[:race] & ["African", "Afro-Caribbean",
				"Black or African-American", "Black, other"]).length > 0
		}.collect{|d| d[:assoc] }.flatten.collect{|d| d[:subject] }.sort
		@tfs['AA'] = TestingFacilitation.where(participant_id: @ego_ids['AA'])
		@ego_ids['Latina'] = studies.flatten.select{|d|
			( (d[:race] & ["African", "Afro-Caribbean",
				"Black or African-American", "Black, other"]).length == 0 ) &&
			( d[:race].include?("Latino or Hispanic (Example: Mexican)" ) ||
				( d[:hisplat] == ["Yes"] )
			)
		}.collect{|d| d[:assoc] }.flatten.collect{|d| d[:subject] }.sort
		@tfs['Latina'] = TestingFacilitation.where(participant_id: @ego_ids['Latina'])
		@ego_ids['Trans'] = studies.flatten.select{|d|
			( ( (d[:race] & ["African", "Afro-Caribbean", "Black or African-American",
				"Black, other", "Latino or Hispanic (Example: Mexican)" ]).length == 0 ) &&
				( d[:hisplat] != ["Yes"] ) &&
				( ( d[:gender] == ["Transfemale"] ) ||
					( d[:sex] == ["Male"] ) )
			)
		}.collect{|d| d[:assoc] }.flatten.collect{|d| d[:subject] }.sort
		@tfs['Trans'] = TestingFacilitation.where(participant_id: @ego_ids['Trans'])
		@ego_ids['Other'] = studies.flatten.select{|d|
			( ( (d[:race] & ["African", "Afro-Caribbean", "Black or African-American",
				"Black, other", "Latino or Hispanic (Example: Mexican)" ]).length == 0 ) &&
				( d[:hisplat] != ["Yes"] ) &&
				( d[:gender] != ["Transfemale"] ) &&
				( d[:sex] != ["Male"] )
			)
		}.collect{|d| d[:assoc] }.flatten.collect{|d| d[:subject] }.sort
		@tfs['Other'] = TestingFacilitation.where(participant_id: @ego_ids['Other'])
	end

	def alters_per_ego
		@studies = Study.all.collect{|s| s.demographics }.flatten
	end

end
