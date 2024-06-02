@echo off
setlocal enabledelayedexpansion

REM ask the user for tag name
set /p tag=Enter tag name:

REM create a tag (just a name)
git tag %tag%

REM push the tag to the remote repository
git push origin %tag%

REM pause the script to see the output
pause