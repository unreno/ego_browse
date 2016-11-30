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

	def hisplats
#		hisplats = ["Yes","No","Other"]
#		hisplats += questions.where(:title => "HISPLAT").collect(&:question_options).flatten.collect(&:name).sort
		hisplats = questions.where(:title => "HISPLAT").collect(&:question_options).flatten.collect(&:name)
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		hisplats << "Unknown"
		hisplats.uniq
	end

	def genders
#		genders = ["Other", "Gender queer/non-binary", "Female", "Transmale/transman", "Male", "Transfemale/transwoman"]
		genders = questions.where(:title => "GENDER").collect(&:question_options).flatten.collect(&:name).sort
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		genders << "Unknown"
		genders.uniq
	end

	def sexes
		sexes = questions.where(:title => "SEX").collect(&:question_options).flatten.collect(&:name).sort
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		sexes << "Unknown"
		sexes.uniq
	end

	def races
		races = questions.where(:title => "RACE").collect(&:question_options).flatten.collect(&:name).sort
		#	Race is in English and Spanish. Take just the English.
		races = races.collect{|race|race[0..(race.index("/")||race.length)-1]}
		races << "More Than One Race"
		races << "Unknown or Not Reported"
		races.uniq
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

	def sex_qid
		@sex_qid ||= questions.where(:title => "SEX").select(:id).collect(&:id).first
	end

	def demographics
		interviews
			.joins("LEFT JOIN answer r ON interview.id = r.interviewId AND r.questionId = #{race_qid}")
			.joins("LEFT JOIN answer h ON interview.id = h.interviewId AND h.questionId = #{hisplat_qid}")
			.joins("LEFT JOIN answer g ON interview.id = g.interviewId AND g.questionId = #{gender_qid}")
			.joins("LEFT JOIN answer s ON interview.id = s.interviewId AND s.questionId = #{sex_qid}")
			.select("interview.id, r.value AS race, h.value AS hispanic, g.value AS gender, s.value AS sex")
			.collect{|i| 
				race = decode(i.race).collect{|x|x[0..(x.index("/")||x.length)-1]}
				race = ["Unknown"] if race.empty?
				race = ["More Than One"] if race.length > 1
				hispanic = decode(i.hispanic).collect{|x|x[0..(x.index("/")||x.length)-1]
				hispanic = ["Unknown"] if hispanic.empty?
				sex = decode(i.sex).collect{|x|x[0..(x.index("/")||x.length)-1]
				sex = ["Unknown"] if sex.empty?
				gender = decode(i.gender).collect{|x|x[0..(x.index("/")||x.length)-1]
				gender = ["Unknown"] if gender.empty?
				{	id: i.id, 
					race: race,
					hispanic: hispanic,
					sex: sex,
					gender: gender
			}	}

#	I don't think that this will return multiples
#	Multiple values are actually concatted and joined with commas

#	Add ||['Other'] ???
	end

	def decode(value)
		@cached_codes ||= {}
		@cached_codes[value] ||= QuestionOption.where(:id => decrypt(value).split(/,/)).collect(&:name)
	end

	def decrypt(value)
		MCRYPT.ivdecrypt(value)
	end

end
