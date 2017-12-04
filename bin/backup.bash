#!/usr/bin/env bash

set -x

#{

mount_point="/home/$USER/box"
dump_dir="$mount_point/DOTS Global/Data/dbdumps"

mount $mount_point

mkdir -p "$dump_dir"

dumpfile="$(date '+%Y%m%d%H%M%S').egoweb.sql.gz"

mysqldump egoweb | gzip > "$dumpfile"

mv "$dumpfile" "$dump_dir/"

umount $mount_point

#} 1>> $mount_point.log 2>&1 

