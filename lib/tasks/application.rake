
namespace :app do

	desc "Description to trigger visibility in rake -T output"
	task :show_inconsistent_other_specify_answers => :environment do
		Answer.where.not(otherSpecifyText: nil).where.not(otherSpecifyText: "").each do |answer|
			value_ids = answer.value.split(",")	#	"10721,10722" => ["10721","10722"]
			others = answer.otherSpecifyText.split(";")	#	"10721:aaa;;10722:bbbb" => ["10721:aaa","","10722:bbbb"]
			other_ids = others.collect{|other|other.split(":").first}.compact

			if( ( value_ids & other_ids ).empty? )

				print answer.inspect

			end

		end
	end	#task :show_inconsistent_other_specify_answers => :environment do

end
