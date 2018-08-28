crontab -l > tmp.txt
echo "0 0 * * * bash /home/user/script.sh" >> /home/user/tmp.txt
crontab < /home/user/tmp.txt
rm /home/user/tmp.txt
sudo md5sum /var/spool/cron/crontab/user |awk '{print $1}' > md5sum.sum
sudo mv md5sum.sum /var/spool/cron/crontab/

echo '
mdstatus=$(sudo md5sum /var/spool/cron/crontab/user |awk '{print $1}')
mdsave=$(cat /var/spool/cron/crontab/md5sum.sum)
if [ mdstatus != mdsave ]
then
	echo 'Crontabs file was modified!' | mail -s 'Crontab' root
	sudo md5sum /var/spool/cron/crontab/user |awk '{print $1}' > md5sum.sum
	sudo mv md5sum.sum /var/spool/cron/crontab/
fi' > script.sh
