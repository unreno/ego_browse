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

This app was created solely for the purpose of browsing the database created by EgoWeb.

https://github.com/qualintitative/egoweb

http://egoweb.wikispaces.com/

##	EgoWeb Mac Installation


Locally, to get egoweb to run I ...

`sudo port install php70 php70-apache2handler php70-mcrypt php70-mysql`

`sudo vi /opt/local/apache2/conf/httpd.conf`

```BASH
LoadModule rewrite_module modules/mod_rewrite.so
LoadModule php7_module        modules/mod_php70.so
<FilesMatch \.php$>
    SetHandler application/x-httpd-php
</FilesMatch>
<Directory "/opt/local/apache2/htdocs">
AllowOverride All
</Directory>
```




`sudo cp /opt/local/etc/php70/php.ini.development /opt/local/etc/php70/php.ini`

`sudo vi /opt/local/etc/php70/php.ini`
Uncommented `extension=php_pdo_mysql.dll` (actually, this is irrelevant)

Added ... (not sure why pdo_mysql and not mysql or mysqli)
Also, may need to up file size limits if importing big file of existing study data.

```BASH
pdo_mysql.default_socket= "/opt/local/var/run/mariadb/mysqld.sock"
pdo_mysql.default_host = localhost
pdo_mysql.default_user = root 

post_max_size = 20M
upload_max_filesize = 20M
```


EgoWeb seems to NEED to be root app and not run in a subdir. 

```BASH
cd /opt/local/apache2/
sudo mv htdocs htdocs.original
git clone https://github.com/qualintitative/egoweb
sudo ln -s egoweb/app htdocs
mysql -u root
CREATE DATABASE egoweb DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
USE egoweb
SOURCE /opt/local/apache2/egoweb/sql/egoweb_db.sql
CREATE USER 'egowebuser'@'localhost' IDENTIFIED BY 'egowebpass';
GRANT ALL PRIVILEGES ON egoweb.* TO 'egowebuser'@'localhost';
quit
cd /opt/local/apache2/htdocs/
./initialize.sh
sudo /opt/local/apache2/bin/apachectl restart
```


Boom.



##	Creation

Noted EgoWeb oddities.
interviewId isn't always an INT.
active isn't always an INT.
interviewers table has interviewerId

```BASH
rails g scaffold AlterList studyId:integer name:text email:text ordering:integer interviewerId:integer  --no-migration --no-assets --no-jbuilder
rails g scaffold AlterPrompt studyId:integer afterAltersEntered:integer display:text --no-migration --no-assets --no-jbuilder
rails g scaffold Alter active:integer ordering:integer name:text interviewId:text alterListId:integer --no-migration --no-assets --no-jbuilder
rails g scaffold Answer active:integer questionId:integer interviewId:integer alterId1:integer alterId2:integer value:text otherSpecifyText:text skipReason:text studyId:integer questionType:text answerType:text --no-migration --no-assets --no-jbuilder
rails g scaffold AnswerList active:integer listName:text studyId:integer listOptionNames:text --no-migration --no-assets --no-jbuilder
rails g scaffold Expression active:integer name:text type:text operator:text value:text resultForUnanswered:boolean studyId:integer questionId:integer --no-migration --no-assets --no-jbuilder
rails g scaffold Graph interviewId:integer expressionId:integer nodes:text params:text --no-migration --no-assets --no-jbuilder
rails g scaffold Interview active:boolean studyId:integer completed:integer start_date:integer complete_date:integer --no-migration --no-assets --no-jbuilder
rails g scaffold Interviewers studyId:integer interviewerId:integer --no-migration --no-assets --no-jbuilder
rails g scaffold Legend studyId:integer questionId:integer shape:string label:string color:string size:integer ordering:integer --no-migration --no-assets --no-jbuilder
rails g scaffold MatchedAlter studyId:integer alterId1:integer alterId2:integer matchedName:string --no-migration --no-assets --no-jbuilder
rails g scaffold Note interviewId:integer expressionId:integer alterId:string notes:text --no-migration --no-assets --no-jbuilder
rails g scaffold OtherSpecify optionId:integer interviewId:integer value:string alterId:integer --no-migration --no-assets --no-jbuilder
rails g scaffold Question active:integer title:text prompt:text preface:text citation:text subjectType:text answerType:text askingStyleList:boolean ordering:integer otherSpecify:boolean noneButton:text allButton:text pageLevelDontKnowButton:text pageLevelRefuseButton:text dontKnowButton:boolean refuseButton:boolean allOptionString:text uselfExpression:text minLimitType:text minLiteral:integer minPrevQues:text maxLimitType:text maxLiteral:integer maxPrevQues:text minCheckableBoxes:integer maxCheckableBoxes:integer withListRange:integer listRangeString:text minListRange:integer maxListRange:integer timeUnits:integer symmetric:integer keepOnSamePage:integer studyId:integer answerReasonExpressionId:integer networkRelationshipExprId:integer networkParams:text networkNColorQId:integer networkNSizeQId:integer networkEColorQId:integer networkESizeQId:integer useAlterListField:text javascript:text --no-migration --no-assets --no-jbuilder
rails g scaffold QuestionOption active:integer studyId:integer questionId:integer name:text value:text ordering:integer otherSpecify:boolean --no-migration --no-assets --no-jbuilder
rails g scaffold Study active:integer name:text introduction:text egoIdPrompt:text alterPrompt:text conclusion:text minAlters:integer maxAlters:integer valueRefusal:integer valueDontKnow:integer valueLogicalSkip:integer valueNotYetAnswered:integer modified:datetime multiSessionEgoId:integer useAsAlters:boolean restrictAlters:boolean fillAlterList:boolean created_date:integer closed_date:integer status:integer userId:integer hideEgoIdPage:boolean style:text javascript:text footer:text --no-migration --no-assets --no-jbuilder
rails g scaffold User email:text password:text name:text lastActivity:datetime permissions:integer --no-migration --no-assets --no-jbuilder
```

For some reason after running this, some field names were corrupt?
I think that that may have been a cut-n-paste issue.
Testing pointed them out and I editted them.

I only wanted to browse existing, so I deleted all routes, actions, views and tests for new, create, edit, update and destroy.



rails g scaffold EligibilityScreening how_learned:string{20} how_learned_other:string age:string{5} sex:string{5} race:string{5} race_other:string children:string{5} seen_pcp:string{5} marital:string{10} tested_hiv:string{5} tested_hiv_result:string{10} partner_count:string{10} injection_drugs:string{5} partner_injection_drugs:string{5} partner_noninjection_drugs:string{5} partner_hiv_positive:string{10} partner_other_partners:string{5} partner_traded_sex:string{5} partner_man_men:string{5} eligible_q_8_15:string{5} where_live:string{5} where_live_other:string willing_to_refer:string{5} matched_to_ego:string{5} eligible:string{5} name_of_screener:string location_of_screening:string date_of_screening:date time_of_screening:time  referred_for_interview:string{5} referred_appointment_date:date referred_appointment_time:time reason_for_refusal:string{50} reason_for_refusal_other:string --no-assets --no-jbuilder


##	Installation

This is a simple rails app. Seriously, nothing special.


```BASH
git clone https://github.com/unreno/ego_browse
bundle install
cp config/database.yml.example config/database.yml
vi config/database.yml
cp config/secrets.yml.example config/secrets.yml
vi config/secrets.yml
rails server -d
open http://localhost:3000
```

###	Production installation

Required the following pre-steps ...

```BASH
sudo apt install ruby ruby-dev libmysqlclient-dev libsqlite3-dev nodejs libmcrypt-dev
gem install bundler
```

```BASH
ssh -L 3000:localhost:3000 rdots
open http://localhost:3000
```

Prefering to use passenger.
Adding apache configuration.
Need to not use port 80, which is being a problem.
Server or router not cooperating.
```BASH
passenger start --port XXX
```

