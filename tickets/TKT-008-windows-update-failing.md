# TKT-008: Windows Update failing
**Category:** Windows | **Priority:** P4 | **Status:** Resolved

## Reported issue
'Update keeps failing with error 0x80070002 / stuck at 0%.'

## How to reproduce in the lab
Stop the Windows Update service and rename `C:\\Windows\\SoftwareDistribution` content or corrupt its download folder; try updating.

## Diagnostics performed
Settings -> Windows Update shows error code; check `C:\\Windows\\Logs\\CBS\\CBS.log`; `sfc /scannow`; `DISM /Online /Cleanup-Image /RestoreHealth`; check free disk space and date/time.

## Root cause
Corrupted Windows Update cache.

## Resolution
Stop `wuauserv` and `bits`, rename `SoftwareDistribution` to `.old`, restart services, run SFC and DISM, retry the update.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Tell user a restart will be required and roughly how long.

## Escalation decision
Escalate if DISM cannot repair the component store (possible in-place upgrade/reimage).

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
