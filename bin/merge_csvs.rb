#!/usr/bin/env ruby

require 'csv'

all_columns=[]

ARGV.each do |infilename|
#	puts infilename

#	:bom|utf-8 NEEDED for screening data, but don't cause issues in others, so keep it.
#	This also removes double quotes from fields unless needed
#	CSV.open( infilename, 'r:bom|utf-8', headers: true, return_headers: true ).each do |incsv|
#		CSV.open( "#{infilename}.psv", 'a', col_sep: '|') do |csv|
#			csv << incsv
#		end
#	end

	f=CSV.open( infilename, 'rb')
	header_line = f.gets
	f.close
	all_columns += header_line

end

all_uniq_columns = all_columns.uniq
puts (['filename']+all_uniq_columns).to_csv

ARGV.each do |infilename|
	(CSV.open( infilename, 'r:bom|utf-8', headers: true )).each do |line|
		puts ([infilename] + all_uniq_columns.collect{|c|line[c]}).to_csv
	end
end

