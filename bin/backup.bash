#!/usr/bin/env bash

set -x

mount_point="/home/ruby/box"
dump_dir="$mount_point/DOTS Global/Data/dbdumps"

mount $mount_point

mkdir -p "$dump_dir"

mysqldump egoweb | gzip > "$dump_dir/$(date '+%Y%m%d%H%M%S').egoweb.sql.gz"

umount $mount_point

