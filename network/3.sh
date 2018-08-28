system_profiler SPBluetoothDataType | grep "Address" |awk '{print $2}' |sed -n 1p
#networksetup -listallhardwareports
