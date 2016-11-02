class Interview < ApplicationRecord
	self.table_name = "interview"
	belongs_to :study, foreign_key: :studyId
	has_many :answers, foreign_key: :interviewId
	has_many :questions, through: :answers

	def demographics
		{ :race => race, :gender => gender, :hispanic => hispanic }
	end

	def race
		( races.length <= 0 ) ? ["Unknown or Not Reported"] : 
			( races.length > 1 ) ? ["More Than One Race"] : races
	end

	def races
		races = answers.joins(:question).where('question.title' => "RACE").collect(&:option_names).flatten
		#	Race is in English and Spanish. Take just the English.
		races.collect{|race|race[0..race.index("/")-1]}
	end

	def gender
		answers.joins(:question).where('question.title' => "GENDER").collect(&:option_names).flatten
	end

	def hispanic
		answers.joins(:question).where('question.title' => "HISPLAT").collect(&:option_names).flatten
	end

end
