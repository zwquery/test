REM Convert images from SRC_FOLDER to DST_FOLDER
REM Those folders must exist
REM "convert" utility has to be in current folder

@echo off
for %%a in (SRC_FOLDER\*.jpg) do convert.exe %%a %%a.jpeg && copy %%a.jpeg DST_FOLDER\%%a.jpeg"