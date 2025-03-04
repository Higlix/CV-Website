#!/bin/bash
cd /home/node/app
git config --global --add safe.directory /home/node/app
mv git-pull.sh /
mv entrypoint.sh /
chmod +x /git-pull.sh
chmod +x /entrypoint.sh
echo '*/2 * * * * /git-pull.sh' | crontab -

#git-pull.sh log system
#echo '*/2 * * * * /git-pull.sh >> /var/log/cron.log 2>&1' | crontab -