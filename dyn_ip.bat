@ECHO OFF
REM Rapidly configure a dynamic IP address for "Wireless Network Connection" card.
REM You may want to change card name in this script

ECHO Resetting IP Address and Subnet Mask For DHCP 
netsh int ip set address name = "Wireless Network Connection" source = dhcp
ipconfig /renew
