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
		hisplats = questions.where(:title => "HISPLAT").collect(&:question_options)
			.flatten.collect(&:name)
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		hisplats << "Unknown"
		hisplats.uniq
	end

	def genders
		genders = questions.where(:title => "GENDER").collect(&:question_options)
			.flatten.collect(&:name).sort
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		genders << "Unknown"
		genders.uniq
	end

	def sexes
		sexes = questions.where(:title => "SEX").collect(&:question_options)
			.flatten.collect(&:name).sort
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		sexes << "Unknown"
		sexes.uniq
	end

	def races
		races = questions.where(:title => "RACE").collect(&:question_options)
			.flatten.collect(&:name).sort
		#	Race is in English and Spanish. Take just the English.
		races = races.collect{|race|race[0..(race.index("/")||race.length)-1]}
		races << "More Than One"
		races << "Unknown"
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

	def subject_qid
		@subject_qid ||= questions.where(:title => "SUBJECT").select(:id).collect(&:id).first
	end

#	> Interview.joins(Arel::Nodes::OuterJoin.new(Answer.arel_table.alias(:a),Arel::Nodes::On.new(Interview.arel_table[:id].eq(Answer.arel_table.alias(:a)[:interviewId]))))
#  Interview Load (687.5ms)  SELECT `interview`.* FROM `interview` LEFT OUTER JOIN `answer` `a` ON `interview`.`id` = `a`.`interviewId`

	#	AGNOSTIC!!!
	def demodemo
		r = Answer.arel_table.alias(:r)
		h = Answer.arel_table.alias(:h)
		g = Answer.arel_table.alias(:g)
		s = Answer.arel_table.alias(:s)
		a = Answer.arel_table.alias(:a)
		i = Interview.arel_table
		interviews
			.joins(Arel::Nodes::OuterJoin.new(r,
				Arel::Nodes::On.new(i[:id].eq(r[:interviewId]).and(r[:questionId].eq(race_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(h,
				Arel::Nodes::On.new(i[:id].eq(r[:interviewId]).and(r[:questionId].eq(hisplat_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(g,
				Arel::Nodes::On.new(i[:id].eq(r[:interviewId]).and(r[:questionId].eq(gender_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(s,
				Arel::Nodes::On.new(i[:id].eq(r[:interviewId]).and(r[:questionId].eq(sex_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(a,
				Arel::Nodes::On.new(i[:id].eq(r[:interviewId]).and(r[:questionId].eq(subject_qid)))))
			.select(i[:id])
			.select(r[:value].as('race'))
			.select(h[:value].as('hispanic'))
			.select(g[:value].as('gender'))
			.select(s[:value].as('sex'))
			.select(a[:value].as('subject'))
			.collect{|i| 
				race = decode(i.race).collect{|x|x[0..(x.index("/")||x.length)-1]}
				race = ["Unknown"] if race.empty?
				race = ["More Than One"] if race.length > 1
				hispanic = decode(i.hispanic).collect{|x|x[0..(x.index("/")||x.length)-1]}
				hispanic = ["Unknown"] if hispanic.empty?
				sex = decode(i.sex).collect{|x|x[0..(x.index("/")||x.length)-1]}
				sex = ["Unknown"] if sex.empty?
				gender = decode(i.gender).collect{|x|x[0..(x.index("/")||x.length)-1]}
				gender = ["Unknown"] if gender.empty?
				subject = decrypt(i.subject)
				subject = ["Unknown"] if subject.empty?
				{	id: i.id, 
					subject: subject,
					race: race,
					hispanic: hispanic,
					sex: sex,
					gender: gender
			}	}
	end

	def demographics
		interviews
			.joins("LEFT JOIN answer r ON interview.id = r.interviewId AND r.questionId = #{race_qid}")
			.joins("LEFT JOIN answer h ON interview.id = h.interviewId AND h.questionId = #{hisplat_qid}")
			.joins("LEFT JOIN answer g ON interview.id = g.interviewId AND g.questionId = #{gender_qid}")
			.joins("LEFT JOIN answer s ON interview.id = s.interviewId AND s.questionId = #{sex_qid}")
			.joins("LEFT JOIN answer a ON interview.id = a.interviewId AND a.questionId = #{subject_qid}")
			.select("interview.id, r.value AS race, h.value AS hispanic, g.value AS gender, s.value AS sex, a.value AS subject")
			.collect{|i| 
				race = decode(i.race).collect{|x|x[0..(x.index("/")||x.length)-1]}
				race = ["Unknown"] if race.empty?
				race = ["More Than One"] if race.length > 1
				hispanic = decode(i.hispanic).collect{|x|x[0..(x.index("/")||x.length)-1]}
				hispanic = ["Unknown"] if hispanic.empty?
				sex = decode(i.sex).collect{|x|x[0..(x.index("/")||x.length)-1]}
				sex = ["Unknown"] if sex.empty?
				gender = decode(i.gender).collect{|x|x[0..(x.index("/")||x.length)-1]}
				gender = ["Unknown"] if gender.empty?
				subject = decrypt(i.subject)
				subject = ["Unknown"] if subject.empty?
				{	id: i.id, 
					subject: subject,
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
