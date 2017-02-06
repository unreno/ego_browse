class Interview < ApplicationRecord
	self.table_name = "interview"
	belongs_to :study, foreign_key: :studyId
	has_many :answers, foreign_key: :interviewId
	has_many :questions, through: :answers

#	def demographics
#		{ :race => race, :gender => gender, :hisplat => hisplat }
#	end
#
#	def race
#		( races.length <= 0 ) ? ["Unknown or Not Reported"] : 
#			( races.length > 1 ) ? ["More Than One Race"] : races
#	end
#
#	def races
#		races = answers.joins(:question).where('question.title' => "RACE").collect(&:option_names).flatten
#		#	Race is in English and Spanish. Take just the English.
#		races.collect{|race|race[0..race.index("/")-1]}
#	end
#
#	def gender
#		answers.joins(:question).where('question.title' => "GENDER").collect(&:option_names).flatten
#	end
#
#	def hisplat
#		answers.joins(:question).where('question.title' => "HISPLAT").collect(&:option_names).flatten
#	end

#	scope :egos, ->{ joins(:questions)
#		.where(:question => { :title => 'SUBJECT' })
#
#	First off, an underscore is a special character that needs escaped, but AREL keeps unescaping it!!
#		or escaping the escape characters!!!!!
#		.where(Answer.arel_table[:value].matches('%_%')) }
#		.where(Answer.arel_table[:value].matches("%\\_%")) }
#		.where(Answer.arel_table[:value].matches('%\\\_%')) }
#	This works but is not agnostic.
#		.where("`answer`.`value` LIKE '%\\_%'") }
#
#	Secondly, this regexs the database which is actually encrypted so won't work.
#
#	I need a field to query on that is not encrypted.


#	def egos
#		answers.joins(:question).where(:question => { :title => 'SUBJECT' })
#
#		.select{|i| i.answer.value == '17P' }
#	end

end
