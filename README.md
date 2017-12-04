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

```
#irb(main):024:0> Study.last.answers
#=> #<ActiveRecord::Associations::CollectionProxy [#<Answer id: 88976, active: nil, questionId: 2844, interviewId: 91, alterId1: nil, alterId2: nil, value: "10751", otherSpecifyText: "10751:test", skipReason: "NONE", studyId: 14, questionType: "EGO_ID", answerType: "MULTIPLE_SELECTION">]>
#irb(main):024:0> Study.last.answers
#=> #<ActiveRecord::Associations::CollectionProxy [#<Answer id: 88977, active: nil, questionId: 2845, interviewId: 92, alterId1: 0, alterId2: 0, value: "10752", otherSpecifyText: "10751:test", skipReason: "NONE", studyId: 15, questionType: "EGO_ID", answerType: "MULTIPLE_SELECTION">]>
#


mysql -u root egoweb < <(zcat ~/Downloads/20170419153302.egoweb.sql.gz)
```



###	Testing

Be advised that this app is built on the database of another.
There are no migrations for the resources of the other app.
Therefore, the existing app database must exist and be
the development database so that its schema can be extracted
and used for test.




###	Production start / stop / etc


```BASH
sudo service ego_browse_passenger stop
git pull
gem update bundler
bundle ins
rake db:migrate
sudo service ego_browse_passenger start
```






###	EGO Web upgrade

Prep remote server to run the latest version of EGO Web straight from their repo.
```BASH
git clone https://github.com/qualintitative/egoweb github_egoweb
cd /var/www
sudo mv html html.old
sudo ln -s github_egoweb html
sudo vi protected/config/main.php	
*	change egowebpass to actual database password
*	change encryptionKey to match that used in db
sudo service apache2 restart
```

Save your database credentials so you won't be prompted for them
```BASH
vi ~/.my.cnf
* add mysql credentials
chmod 400 ~/.my.cnf
```

Download and import the latest EGO Web data dump.
Update for the latest EGO Web.
Correct the 3 survey question / answer values.


Install davfs2 to mount the box drive
```BASH
sudo apt install davfs2
sudo echo "https://dav.box.com/dav /home/USERNAME/box davfs user,rw,noauto 0 0" >> /etc/fstab
mkdir ~/box
mkdir ~/.davfs2
chmod 700 ~/.davfs2
echo "/home/USERNAME/box boxdchs@people.unr.edu PASSWORD" >> ~/.davfs2/secrets
chmod 600 ~/.davfs2/secrets 
sudo gpasswd -a USERNAME davfs2
mount ~/box
```


Connect to cloud server
```BASH
sudo ssh -L 9980:localhost:80 -L 9443:localhost:443 -L 9300:localhost:3000 -L 9344:localhost:3443  -i /Users/jakewendt/.ssh/id_rsa jakewendt@ego.acs.unr.edu
```

Import database into cloud server

```BASH
mount box
cp "$( ls -1tr box/DOTS\ Global/Data/dbdumps/*.egoweb.sql.gz | tail -n 1 )" ~/dbdumps/
chmod 400 ~/dbdumps/*
umount box
mysql -u ruby egoweb < <(zcat $(ls -1tr ~/dbdumps/*.egoweb.sql.gz | tail -n 1 ) )
mysql -u ruby egoweb < /var/www/ego_browse/egoweb_update.sql
```


###	EGO Web CSV exports

Download "Export Other Specify Data" from latest version of EgoWeb due to old app issues.

Edit survey and Download "Export Ego-Alter Data".
The answer values for several questions are the same for each answer.
Change No value to 0 for the following 3 questions.
SMOKED_EV, CALL911, SABUSERU18GANG
( this is now done in the egoweb_update.sql script. )




