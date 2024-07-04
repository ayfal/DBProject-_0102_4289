@echo off
setlocal enabledelayedexpansion

REM Pull the latest changes from the remote repository
git pull

REM Check if the pull was successful
IF %ERRORLEVEL% EQU 0 (
    REM ask the user if they want to push their changes
    set /p push_changes="Do you want to push your changes? (y/n): "

    REM if they do, stage, commit, and push the changes
    IF /I "!push_changes!"=="y" (
        REM Stage all changes
        git add -A

        REM Ask the user for the commit message
        set /p commit_message="Enter commit message: "
        
        REM Commit the changes with the user-provided message
        git commit -m "!commit_message!"
        
        REM Push any local changes to the remote repository
        git push
    )
)

REM Pause the script to see the output
pause