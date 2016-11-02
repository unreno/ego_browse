class StaticsController < ApplicationController


#	Question.where(:title => "RACE")
#	GENDER
#	HISPLAT

	def counts
		studyId = 1
		@races = Study.find(studyId).races
		@demographics = Study.find(studyId).interviews.collect(&:demographics)
	end

end
