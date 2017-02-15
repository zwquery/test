REM Reduce "mp4" video files
REM It needs "ffmpeg" of course

@echo off
chcp 1252
for %%a IN (SRC_FOLDER\*.mp4) do D:\sebastienw\Tools\ffmpeg\bin\ffmpeg -i "%%a" -vcodec libx264 -crf 20 "DST_FOLDER\%%~na.mp4"
pause
