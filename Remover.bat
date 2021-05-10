@echo off
set /p name=Enter file name: 
set /p start_time=Start Time:
set /p end_time=End Time:
set /p file1=File 1:

ffmpeg -i "%name%" -ss "%start_time%" -to "%end_time%" -c copy "%file1%.mp4"

set /p start_time1=Start Time:
set /p end_time1=End Time:
set /p file2=File 2:
ffmpeg -i "%name%" -ss "%start_time1%" -to "%end_time1%" -c copy "%file2%.mp4"

set /p output=Combined Output File Name:
echo file '%file1%.mp4' >list.txt
echo file '%file2%.mp4' >>list.txt
ffmpeg -safe 0 -f concat -i list.txt -c copy "%output%".mp4
pause