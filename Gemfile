source 'https://rubygems.org'

gem 'bundler'


gem 'passenger'
gem 'ruby-mcrypt', :require => 'mcrypt'
gem 'will_paginate'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
#gem 'rails', '~> 5.1.3'
gem 'rails', '~> 5.1'

gem 'mysql2'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
	# Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
	# Use sqlite3 as the database for Active Record
	gem 'sqlite3'

	#	For eventual stubbing
	#gem "mocha", :require => 'mocha/api'

	#	For pretty printing
	#	Doesn't raise errors in the right place in Rails 5
	gem "jakewendt-test_with_verbosity"



#	This will need local Validator SAC installed and setup
#	gem "test-unit"	#	needed for my html_test???
#	gem 'jakewendt-html_test'


#	gem 'minitest', '= 5.3.3' #	Solely to preserve alphabetical order in test running

	gem "simplecov", :require => false	#	for coverage testing
#	gem "mocha"	#, :require => 'mocha/setup'
	gem "mocha"	#, :require => 'mocha/api'
	#	mocha requires "require 'mocha/mini_test'" near the bottom of test/test_helper.rb

	gem "factory_bot_rails"

	gem "autotest-rails", :require => 'autotest/rails'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]




gem 'authlogic'
gem 'rails-controller-testing'


#	libv8 / therubyrace install issues
#
#	problems installing therubyracer / libv8
#
#	sudo port uninstall libtool
#	sudo port select gcc none
#	gem install libv8 -v 3.16.14.19
#	bundle ins
#	
#
