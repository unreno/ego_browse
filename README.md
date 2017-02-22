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





##	Start

```BASH
cd /var/www/ego_browse
passenger stop --port 3000
sudo iptables --policy INPUT ACCEPT
passenger start --port 3000 --daemonize
```


 Question.where(:title => 'SUBJECT').last.answers.select{|a|a.value == '041_3'}.first.interview.answers.joins(:question).where('question.title' => 'HIVTEST_LAST')


Answer.where(Answer.arel_table[:otherSpecifyText].not_eq('')).collect{|a|MCRYPT.ivdecrypt(a.otherSpecifyText)}.select{|a| a =~ /aaa/i}





###	Question Option other specify text not properly exported / imported

Create new study, with intro, and save.
Create new question, multiple select.
Add a couple options with specify
Take interview. (Oddly, text for the option not being shown for me???)
Export with interviews
Import
Export with interviews
Decrypt answer's value and otherSpecifyText.
The value will have been updated to the appropriate question option id,
HOWEVER, the id in the otherSpecifyText WILL NOT.

#irb(main):024:0> Study.last.answers
#=> #<ActiveRecord::Associations::CollectionProxy [#<Answer id: 88976, active: nil, questionId: 2844, interviewId: 91, alterId1: nil, alterId2: nil, value: "10751", otherSpecifyText: "10751:test", skipReason: "NONE", studyId: 14, questionType: "EGO_ID", answerType: "MULTIPLE_SELECTION">]>
#irb(main):024:0> Study.last.answers
#=> #<ActiveRecord::Associations::CollectionProxy [#<Answer id: 88977, active: nil, questionId: 2845, interviewId: 92, alterId1: 0, alterId2: 0, value: "10752", otherSpecifyText: "10751:test", skipReason: "NONE", studyId: 15, questionType: "EGO_ID", answerType: "MULTIPLE_SELECTION">]>
#





