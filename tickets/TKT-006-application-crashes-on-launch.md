# TKT-006: Application crashes on launch
**Category:** Software | **Priority:** P3 | **Status:** Resolved

## Reported issue
'Application X closes immediately after opening.'

## How to reproduce in the lab
Pick a lightweight app (e.g. 7-Zip or Notepad++). Corrupt its settings file/folder in `%APPDATA%` so it fails to start, or use an app with a known faulty config.

## Diagnostics performed
Event Viewer -> Windows Logs -> Application, look for Error with source 'Application Error' and the faulting module. Try Safe Mode/clean boot; check for recent updates; test with a new user profile.

## Root cause
Corrupted per-user configuration (confirmed because a fresh profile works).

## Resolution
Rename the app's `%APPDATA%` folder (back it up first), relaunch so it regenerates. If it persists, repair/reinstall via Settings -> Apps.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Tell user settings may reset and what was backed up.

## Escalation decision
Escalate to the application owner/vendor if the crash reproduces across profiles with a faulting module in the app itself.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
