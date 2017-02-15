REM Rapidly configure a static IP address for "Wireless Network Connection" card.
REM You may want to change card name in this script

@echo off
echo "Setting Static IP Information" 
netsh interface ip set address "Wireless Network Connection" static 192.168.1.3 255.255.255.0 192.168.1.1
netsh interface ip set dns "Wireless Network Connection" static 8.8.8.8
netsh interface ip add dns "Wireless Network Connection" static 8.8.4.4 
netsh int ip show config 