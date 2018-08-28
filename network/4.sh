networksetup -getinfo Ethernet |grep "^Router"
#route -n get www.yahoo.com |grep "    gateway:" |sed 's/    gateway:/router\/gateway:/'
