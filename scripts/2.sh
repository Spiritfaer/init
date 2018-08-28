echo "sudo apt-get update &>> /var/log/update_script.log && sudo apt-get upgrade &>> /var/log/update_script.log" > script.sh &&
echo "0 4 * * 7 bash /home/user/script.sh" > tmp.txt &&
crontab tmp.txt &&
rm tmp.txt
