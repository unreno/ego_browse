require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

	test "responds to question" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.question
	end

	test "responds to interview" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.interview
	end

	test "responds to study" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.study
	end

	test "responds to alter1" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.alter1
	end

	test "responds to alter2" do
		assert_nil self.class.name.gsub(/Test$/,'').constantize.new.alter2
	end

	test "should collect question option names" do
		qo1 = QuestionOption.create(name: 'QO1')
		qo2 = QuestionOption.create(name: 'QO2')
		answer = Answer.create(
			answerType: 'MULTIPLE_SELECTION',
			value: MCRYPT.myencrypt("#{qo1.id},#{qo2.id}")
		)
		assert_equal answer.reload.option_names, ['QO1','QO2']
	end

#	MCRYPT.mydecrypt(MCRYPT.myencrypt('asd'))
#=> "asd"

	test "should collect question option values" do
		qo1 = QuestionOption.create(value: 'QO1')
		qo2 = QuestionOption.create(value: 'QO2')
		answer = Answer.create(
			answerType: 'MULTIPLE_SELECTION',
			value: MCRYPT.myencrypt("#{qo1.id},#{qo2.id}")
		)
		assert_equal answer.reload.option_values, ['QO1','QO2']
	end

end
