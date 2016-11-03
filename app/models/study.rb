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

	def race_qid
		@race_qid ||= questions.where(:title => "RACE").select(:id).collect(&:id).first
	end

	def hisplat_qid
		@hisplat_qid ||= questions.where(:title => "HISPLAT").select(:id).collect(&:id).first
	end

	def gender_qid
		@gender_qid ||= questions.where(:title => "GENDER").select(:id).collect(&:id).first
	end

	def demographics
		interviews
			.joins("LEFT JOIN answer r ON interview.id = r.interviewId AND r.questionId = #{race_qid}")
			.joins("LEFT JOIN answer h ON interview.id = h.interviewId AND h.questionId = #{hisplat_qid}")
			.joins("LEFT JOIN answer g ON interview.id = g.interviewId AND g.questionId = #{gender_qid}")
			.select("interview.id, r.value AS race, h.value AS hispanic, g.value AS gender")
			.collect{|i| 
				{	id: i.id, 
					race: decode(i.race).collect{|race|race[0..race.index("/")-1]},
					hispanic: decode(i.hispanic),
					gender: decode(i.gender)
			}	}
	end

	def decode(value)
		QuestionOption.where(:id => decrypt(value).split(/,/)).collect(&:name)
	end

	def decrypt(value)
		MCRYPT.ivdecrypt(value)
	end

end
