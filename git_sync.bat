@echo off
setlocal enabledelayedexpansion

REM Pull the latest changes from the remote repository
git pull

REM Check if the pull was successful
IF %ERRORLEVEL% EQU 0 (
    REM Stage all changes
    git add -A

    REM Ask the user for the commit message
    set /p commit_message="Enter commit message: "
    echo "%commit_message%"
    REM Commit the changes with the user-provided message
    git commit -m "!commit_message!"
    echo "%commit_message%"
    REM Push any local changes to the remote repository
    git push
)

REM Pause the script to see the output
pause