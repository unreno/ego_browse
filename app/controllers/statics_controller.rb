class StaticsController < ApplicationController


#	Question.where(:title => "RACE")
#	GENDER
#	HISPLAT

	def counts
		@studies = []
		Study.all.each do |study|
			s = {}
			s[:id] = study.id
			s[:races] = study.races
			#s[:demographics] = study.interviews.collect(&:demographics)
			s[:demographics] = study.demographics
			@studies << s
		end
#		@studies = Study.all.collect(&:demographics)
	end

end
