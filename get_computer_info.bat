@echo off
REM This Windows batch file uses "wmic" to collect some informations about one computer in AD
REM Please, use PowerShell for more features...   :p
REM It deletes itself (and the log file if closed first)

echo Please wait...
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.


chcp 850 > nul
REM For Belgium, chcp 850 is better...

echo This script could help network admins >> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo ******************************************************>> mysuperhiddeninfo.txt
echo Please, send this file to mail@domain.com >> mysuperhiddeninfo.txt
echo ******************************************************>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo Computer  >> mysuperhiddeninfo.txt
echo %username% >> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
wmic bios get serialnumber |more>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
wmic ComputerSystem Get Model |more>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
wmic computersystem get name |more>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
net use >> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo Domain : >> mysuperhiddeninfo.txt
echo %userdomain% >> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
ver >> mysuperhiddeninfo.txt
wmic os get ServicePackMajorVersion |more>> mysuperhiddeninfo.txt
echo.>> mysuperhiddeninfo.txt
echo Finished !
mysuperhiddeninfo.txt
del mysuperhiddeninfo.txt
del %0
exit
