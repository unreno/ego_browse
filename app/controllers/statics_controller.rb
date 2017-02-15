class StaticsController < ApplicationController

	def demographic_counts
		@studies = Study.all.collect{|s|s.demographics_hash}
	end

	#	try to move this into the model?

	#	TODO EGO race includes any of African, Caribean, Black (other), Black (or AA)
	def black_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_raw_demographics
				.select{|d| 
					(d[:race] & ["African", "Afro-Caribbean", "Black or African-American", "Black, other"]).length > 0 
				}
				.collect{|d| d[:assoc] }.flatten
			s[:demographics].collect!{|ss|
				ss[:race] = ["Unknown"] if ss[:race].empty?
				ss[:hisplat] = ["Unknown"] if ss[:hisplat].empty?
				ss[:sex] = ["Unknown"] if ss[:sex].empty?
				ss[:gender] = ["Unknown"] if ss[:gender].empty?
				ss[:subject] = ["Unknown"] if ss[:subject].empty?
				ss[:race] = ["More Than One"] if ss[:race].length > 1
				ss
			}
			@studies << s
		end
		render :demographic_counts
	end

	#	TODO EGO Race NOT IN African, Caribean, Black (other), Black (or AA)
	#	TODO EGO Race in Latino OR EGO hispanicity == YES
	def latina_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
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
				.collect{|d| d[:assoc] }.flatten
			s[:demographics].collect!{|ss|
				ss[:race] = ["Unknown"] if ss[:race].empty?
				ss[:hisplat] = ["Unknown"] if ss[:hisplat].empty?
				ss[:sex] = ["Unknown"] if ss[:sex].empty?
				ss[:gender] = ["Unknown"] if ss[:gender].empty?
				ss[:subject] = ["Unknown"] if ss[:subject].empty?
				ss[:race] = ["More Than One"] if ss[:race].length > 1
				ss
			}
			@studies << s
		end
		render :demographic_counts
	end

	#	TODO EGO Race NOT IN African, Caribean, Black (other), Black (or AA), Latino 
	#	TODO EGO hispanicity NOT YES
	#	TODO EGO gender = transfemale or sex == Male
	def trans_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
#				.select{|d| d[:sex] != d[:gender] }			#	likely more to it than this
			s[:demographics] = study.nested_raw_demographics
				.select{|d| 
					( ( (d[:race] & ["African", "Afro-Caribbean", "Black or African-American",
						"Black, other", "Latino or Hispanic (Example: Mexican)" ]).length == 0 ) &&
						( d[:hisplat] != ["Yes"] ) &&
						( ( d[:gender] == ["Transfemale"] ) || 
							( d[:sex] == ["Male"] ) )
					)
				}
				.collect{|d| d[:assoc] }.flatten
			s[:demographics].collect!{|ss|
				ss[:race] = ["Unknown"] if ss[:race].empty?
				ss[:hisplat] = ["Unknown"] if ss[:hisplat].empty?
				ss[:sex] = ["Unknown"] if ss[:sex].empty?
				ss[:gender] = ["Unknown"] if ss[:gender].empty?
				ss[:subject] = ["Unknown"] if ss[:subject].empty?
				ss[:race] = ["More Than One"] if ss[:race].length > 1
				ss
			}
			@studies << s
		end
		render :demographic_counts
	end

	#	TODO EGO Race NOT IN African, Caribean, Black (other), Black (or AA), Latino 
	#	TODO EGO hispanicity NOT YES

	#	TODO *NOT* EGO gender = transfemale or sex == Male

	def leftover_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
#				.select{|d| d[:sex] != d[:gender] }			#	likely more to it than this
			s[:demographics] = study.nested_raw_demographics
				.select{|d| 
					( ( (d[:race] & ["African", "Afro-Caribbean", "Black or African-American",
						"Black, other", "Latino or Hispanic (Example: Mexican)" ]).length == 0 ) &&
						( d[:hisplat] != ["Yes"] ) &&
						( d[:gender] != ["Transfemale"] ) &&
						( d[:sex] != ["Male"] )
					)
				}
				.collect{|d| d[:assoc] }.flatten
			s[:demographics].collect!{|ss|
				ss[:race] = ["Unknown"] if ss[:race].empty?
				ss[:hisplat] = ["Unknown"] if ss[:hisplat].empty?
				ss[:sex] = ["Unknown"] if ss[:sex].empty?
				ss[:gender] = ["Unknown"] if ss[:gender].empty?
				ss[:subject] = ["Unknown"] if ss[:subject].empty?
				ss[:race] = ["More Than One"] if ss[:race].length > 1
				ss
			}
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
#		@studies = Study.all.collect{|s|s.nested_raw_demographics}
	end

	def alters_per_ego
		@studies = Study.all.collect{|s| s.demographics }.flatten
	end

end
