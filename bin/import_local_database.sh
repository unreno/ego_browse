#!/usr/bin/env bash

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

dbdumps=~/dbdumps

mkdir -p "${dbdumps}"
mount box
cp "$( ls -1tr box/DOTS\ Global/Data/dbdumps/*.egoweb.sql.gz | tail -n 1 )" "${dbdumps}/"
umount box
mysql -u ruby egoweb < <(zcat $(ls -1tr "${dbdumps}"/*.egoweb.sql.gz | tail -n 1 ) )

#	update database to match latest version of egoweb requirements
#
#	mysql -u ruby egoweb < /var/www/ego_browse/egoweb_update.sql


