# TKT-007: PC running very slowly
**Category:** Windows | **Priority:** P4 | **Status:** Resolved

## Reported issue
'My computer takes forever to start and open things.'

## How to reproduce in the lab
Add many startup items, fill the disk to 95%, or run a CPU stress tool in the background.

## Diagnostics performed
Task Manager -> Performance/Processes (CPU, RAM, Disk), Startup tab; `Get-Volume` for free space; Resource Monitor for disk queue; check for pending updates.

## Root cause
Too many startup programs and low free disk space (adapt to what you actually found).

## Resolution
Disable unneeded startup apps, run Disk Cleanup/`cleanmgr`, remove temp files, check for malware, confirm RAM adequacy.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Explain what was slowing it down and give 2 simple habits to keep it fast.

## Escalation decision
Escalate for hardware replacement if the disk shows SMART failures or RAM is persistently exhausted.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
