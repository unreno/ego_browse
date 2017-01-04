# EGO Browse README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



##	Purpose

https://github.com/unreno/ego_browse/wiki/EGO-Browse-Purpose

##	EgoWeb Mac Installation

https://github.com/unreno/ego_browse/wiki/EGO-Web-Install

##	Creation

https://github.com/unreno/ego_browse/wiki/EGO-Browse-Creation

##	Installation

https://github.com/unreno/ego_browse/wiki/EGO-Browse-Install



config/database.yml
config/mcrypt.yml
config/secrets.yml


Create a couple users. Use your own passwords!

/etc/init.d/apache2 status

RailsUser.create(:login => 'admin', :password => 'test123!', :password_confirmation =>'test123!')
RailsUser.create(:login => 'readonly', :password => 'test123!', :password_confirmation =>'test123!')

For some reason, in production, nothing loads in the console.

Need to ...
require 'application_record'
require 'rails_user'


