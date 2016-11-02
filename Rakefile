# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

#	User's rake files in lib/tasks/ are source HERE, BEFORE rails core tasks!
#	I guess that this means that anything that overrides them must be
#	put in this file and after the next line.

Rails.application.load_tasks

#	Any rails overriding rake tasks go after here.

DISABLED_TASKS = [
	'db:drop',
	'db:migrate:reset',
	'db:schema:load',
	'db:seed',
]

namespace :app do
	desc "Disable a task in production environment"
	task :guard_for_production do
#		if Rails.env.production?
			if ENV['I_KNOW_THIS_MAY_SCREW_THE_DB'] != "1"
				puts 'This task is disabled in production.'
				puts 'If you really want to run it, call it again with `I_KNOW_THIS_MAY_SCREW_THE_DB=1`'
				exit
#			else
#				require 'heroku'
#				puts 'Making a backup of the database, just in case...'
#				puts `heroku pgbackups:capture`
			end
#		end
	end
end


DISABLED_TASKS.each do |task|
	Rake::Task[task].enhance ['app:guard_for_production']
end

