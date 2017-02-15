REM This script saves "D" drive content on USB (J) in backup subfolder.
REM Don't forget to change D, F and... have a backup folder on the key.
@echo off
cls
title Saving...
color 0a

echo        Backing up         
echo ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo     ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
echo            ÄÄÄÄÄ
echo.
echo.
pause
echo Please connect USB drive...
pause
xcopy "D:\*.*" "F:\backup\" /d /e /s /y
xcopy "D:\*" "F:\backup\" /d /e /s /y
echo Finished !
pause
exit