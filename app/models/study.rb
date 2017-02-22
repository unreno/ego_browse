class StudyHash < Hash

#	This was meant to be a specific hash, at some point

end

class DemoArray < Array

	def select(*args)
		DemoArray.new(super)
	end

	def collect(*args)
		DemoArray.new(super)
	end

	def flatten(*args)
		DemoArray.new(super)
	end

	def singularize
		DemoArray.new(collect do |d|
			d[:race] = ["Unknown"] if d[:race].empty?
			d[:race] = ["More Than One"] if d[:race].length > 1
			d[:hisplat] = ["Unknown"] if d[:hisplat].empty?
			d[:sex] = ["Unknown"] if d[:sex].empty?
			d[:gender] = ["Unknown"] if d[:gender].empty?
			d[:subject] = "Unknown" if d[:subject].empty?
			d
		end)
	end

end

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

#	=> ["No", "Yes/Sí"]
	def hisplats
		hisplats = questions.where(title: "HISPLAT").collect(&:question_options)
			.flatten.collect(&:name)
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		hisplats << "Unknown"
		hisplats.uniq
	end

#	=> ["Female/Femenino", "Gender queer/non-binary/Género “queer” /no binario", "Male/Masculino", "Other/Otro", "Transfemale/transwoman/Mujer transgénero/transmujer", "Transmale/transman/Hombre transgénero/trans hombre"]
	def genders
		genders = questions.where(title: "GENDER").collect(&:question_options)
			.flatten.collect(&:name).sort
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		genders << "Unknown"
		genders.uniq
	end

#	=> ["Female/Femenino", "Inter-Sex", "Male/Masculino"]
	def sexes
		sexes = questions.where(title: "SEX").collect(&:question_options)
			.flatten.collect(&:name).sort
			.collect{|x|x[0..(x.index("/")||x.length)-1]}
		sexes << "Unknown"
		sexes.uniq
	end

#	=> ["African/Africano", "Afro-Caribbean/Afrocaribeño", "American Indian or Alaskan Native/Indio americano o nativo de Alaska", "Asian/Asiático", "Black or African-American/Negro o afroamericano", "Black, other/Negro, otro", "Latino or Hispanic (Example: Mexican)/Latino o hispano (ejemplo: Mexicano)", "Native Hawaiian or Pacific Islander/Nativo de Hawaii o Isleño pacifico", "Other/Otro", "White/Blanco"]
	def races
		races = questions.where(title: "RACE").collect(&:question_options)
			.flatten.collect(&:name).sort
		#	Race is in English and Spanish. Take just the English.
		races = races.collect{|race|race[0..(race.index("/")||race.length)-1]}
		races << "More Than One"
		races << "Unknown"
		races.uniq
	end

	def race_qid
		@race_qid ||= questions.where(title: "RACE").select(:id).collect(&:id).first
	end

	def hisplat_qid
		@hisplat_qid ||= questions.where(title: "HISPLAT").select(:id).collect(&:id).first
	end

	def gender_qid
		@gender_qid ||= questions.where(title: "GENDER").select(:id).collect(&:id).first
	end

	def sex_qid
		@sex_qid ||= questions.where(title: "SEX").select(:id).collect(&:id).first
	end

	def subject_qid
		@subject_qid ||= questions.where(title: "SUBJECT").select(:id).collect(&:id).first
	end

	def raw_demographics
		r = Answer.arel_table.alias(:r)
		h = Answer.arel_table.alias(:h)
		g = Answer.arel_table.alias(:g)
		s = Answer.arel_table.alias(:s)
		a = Answer.arel_table.alias(:a)
		i = Interview.arel_table
		DemoArray.new(interviews
			.joins(Arel::Nodes::OuterJoin.new(r,
				Arel::Nodes::On.new(i[:id].eq(r[:interviewId]).and(r[:questionId].eq(race_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(h,
				Arel::Nodes::On.new(i[:id].eq(h[:interviewId]).and(h[:questionId].eq(hisplat_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(g,
				Arel::Nodes::On.new(i[:id].eq(g[:interviewId]).and(g[:questionId].eq(gender_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(s,
				Arel::Nodes::On.new(i[:id].eq(s[:interviewId]).and(s[:questionId].eq(sex_qid)))))
			.joins(Arel::Nodes::OuterJoin.new(a,
				Arel::Nodes::On.new(i[:id].eq(a[:interviewId]).and(a[:questionId].eq(subject_qid)))))
			.select(i[:id])
			.select(r[:value].as('race'))
			.select(h[:value].as('hisplat'))
			.select(g[:value].as('gender'))
			.select(s[:value].as('sex'))
			.select(a[:value].as('subject'))
			.collect{|i| 
				race = decode(i.race).collect{|x|x[0..(x.index("/")||x.length)-1]}
				hisplat = decode(i.hisplat).collect{|x|x[0..(x.index("/")||x.length)-1]}
				sex = decode(i.sex).collect{|x|x[0..(x.index("/")||x.length)-1]}
				gender = decode(i.gender).collect{|x|x[0..(x.index("/")||x.length)-1]}
				subject = MCRYPT.mydecrypt(i.subject)
#				StudyHash[
				{	id: i.id, 
					subject: subject,
					race: race,
					hisplat: hisplat,
					sex: sex,
					gender: gender
#			]	
			} }
		)
	end

	def demographics
		raw_demographics.singularize
	end

	def demographics_hash
		s = {}
		s[:id] = self.id
		s[:hisplats] = self.hisplats
		s[:genders] = self.genders
		s[:sexes] = self.sexes
		s[:races] = self.races
		s[:demographics] = self.demographics
		s
	end



	#	Returns array of hashes with :assoc[] containing ego and matching alters.
	#	DOES NOT include ALTERs with no matching EGO
	def nested_demographics
		#	Using Marshal stuff here to copy the values to avoid self referencing.
		demo = Marshal.load( Marshal.dump(demographics) )

		#	Select the EGOs and add an empty array to hold the associated subjects.
		ea = demo.select{|d| d[:subject] !~ /_/ }.each{|d| d[:assoc] = [] }

		#	Add all to the assoc[] for the appropriate ego. (if exists)
		demo.each{|d| 
			z = ea.detect{|y| y[:subject] == d[:subject].split(/_/)[0] }
			z[:assoc] << Marshal.load( Marshal.dump(d) ) if z.present?
		}
		ea
	end

	def nested_raw_demographics
		#	Using Marshal stuff here to copy the values to avoid self referencing.
		demo = Marshal.load( Marshal.dump(raw_demographics) )

		#	Select the EGOs and add an empty array to hold the associated subjects.
		ea = demo.select{|d| d[:subject] !~ /_/ }.each{|d| d[:assoc] = [] }

		#	Add all to the assoc[] for the appropriate ego. (if exists)
		demo.each{|d| 
			z = ea.detect{|y| y[:subject] == d[:subject].split(/_/)[0] }
			z[:assoc] << Marshal.load( Marshal.dump(d) ) if z.present?
		}
		ea
	end

	#	Returns array of hashes with :alters[] containing matching alters.
	#	DOES NOT include ALTERs with no matching EGO
	def ego_alter_demographics
		#	Don't need to worry about Marshal or clone as not nesting hash within self.
		demo = demographics

		#	Select the EGOs and add an empty array to hold the alters.
		ea = demo.select{|d| d[:subject] !~ /_/ }.each{|d| d[:alters] = [] }

		#	Select the alters and add them to the alters[] for the appropriate ego. (if exists)
		demo.select{|d| d[:subject] =~ /_/ }.each{|d| 
			z = ea.detect{|y| y[:subject] == d[:subject].split(/_/)[0] }
			z[:alters] << d if z.present?
		}
		ea
	end

	#	should really be elsewhere or global
	def decode(value)
		@cached_codes ||= {}
		@cached_codes[value] ||= QuestionOption.where(id: MCRYPT.mydecrypt(value).split(/,/)).collect(&:name)
	end

end
