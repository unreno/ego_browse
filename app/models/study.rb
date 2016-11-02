class Study < ApplicationRecord
	self.table_name = "study"
	belongs_to :user, foreign_key: :userId
	has_many :alter_lists, foreign_key: :studyId
	has_many :alter_prompts, foreign_key: :studyId
	has_many :answer_lists, foreign_key: :studyId
	has_many :answers, foreign_key: :studyId
	has_many :expressions, foreign_key: :studyId
	has_many :interviewers, foreign_key: :studyId
	has_many :interviews, foreign_key: :studyId
	has_many :legends, foreign_key: :studyId
	has_many :matched_alters, foreign_key: :studyId
	has_many :question_options, foreign_key: :studyId
	has_many :questions, foreign_key: :studyId

	def races
		races = questions.where(:title => "RACE").collect(&:question_options).flatten.collect(&:name).sort
		#	Race is in English and Spanish. Take just the English.
		races = races.collect{|race|race[0..race.index("/")-1]}
		races << "More Than One Race"
		races << "Unknown or Not Reported"
	end

end
