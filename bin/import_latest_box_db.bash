#!/usr/bin/env bash


#	set this to run every day around 2am.

{

set -x

#	Save your database credentials so you won't be prompted for them
#
#	vi ~/.my.cnf
#	* add mysql credentials
#
#		[mysql]
#		database=egoweb
#		user=ruby
#		password=
#
#	chmod 400 ~/.my.cnf
#

#dbdumps=~/dbdumps

#mkdir -p "${dbdumps}"

mount $HOME/box
mysql -u ruby egoweb < <(zcat "$( ls -1tr box/DOTS\ Global/Data/dbdumps/*.egoweb.sql.gz | tail -n 1 )" )
umount $HOME/box


#	update database to match latest version of egoweb requirements
#
#	mysql -u ruby egoweb < /var/www/ego_browse/egoweb_update.sql

} 1>> $HOME/`basename $0`.log 2>&1

