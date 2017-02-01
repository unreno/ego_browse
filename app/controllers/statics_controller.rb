class StaticsController < ApplicationController

#	Question.where(:title => "RACE")
#	GENDER
#	HISPLAT


	def demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.demographics
			@studies << s
		end
	end

#All
#Black: where sex = gender
#Latina: where sex = gender
#Trans: where sex != gender

#	TODO special reports for NIH
#	TODO need to group races to just American Indian, Asian, Natice Hawaiian, Black or AA, White, More than one, Unknown
#	TODO need to group sexes to just Male, Female, Unknown


	#	TODO Black at all. Either of Black races even if more than one!
#	TODO does sex or gender matter?
	def black_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_demographics
				.select{|d| d[:race] == ["Black or African-American"] }
				.select{|d| d[:sex] == d[:gender] }
				.collect{|d| d[:assoc] }.flatten
			@studies << s
		end
		render :demographic_counts
	end

	#	TODO filter by Latino race, not hispanicity?
#	TODO does sex or gender matter?
	def latina_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_demographics
				.select{|d| d[:hispanic] == ["Yes"] }		#	should this be by race or by hispanicity?
				.select{|d| d[:sex] == d[:gender] }
				.collect{|d| d[:assoc] }.flatten
			@studies << s
		end
		render :demographic_counts
	end

	#	TODO definition of trans is not quite clear yet
#	TODO possibly gender = trans* or gender != sex
	def trans_demographic_counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			s[:demographics] = study.nested_demographics
				.select{|d| d[:sex] != d[:gender] }			#	likely more to it than this
				.collect{|d| d[:assoc] }.flatten
			@studies << s
		end
		render :demographic_counts
	end

	def alters_per_ego
		@studies = Study.all.collect{|s| s.demographics }.flatten
	end

	def screening_report_eligible
	end

end
