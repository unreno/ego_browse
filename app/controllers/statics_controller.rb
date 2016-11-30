class StaticsController < ApplicationController


#	Question.where(:title => "RACE")
#	GENDER
#	HISPLAT

	def counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:hisplats] = study.hisplats
			s[:genders] = study.genders
			s[:sexes] = study.sexes
			s[:races] = study.races
			#s[:demographics] = study.interviews.collect(&:demographics)
			s[:demographics] = study.demographics
			@studies << s
		end
	end

end
