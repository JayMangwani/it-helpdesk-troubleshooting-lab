# TKT-010: New hire account setup
**Category:** AD administration | **Priority:** P4 | **Status:** Resolved

## Reported issue
Request: onboard a new employee in Finance.

## How to reproduce in the lab
Submit a request ticket with name, role, manager, department, start date, required access.

## Diagnostics performed
Confirm approvals; check naming convention; confirm no duplicate `samAccountName`.

## Root cause
Standard onboarding request (no fault).

## Resolution
`New-ADUser` in the correct OU (see `scripts/ad-bulk-users.ps1`), set temp password with change-at-logon, add to `GG-Finance` + baseline groups, record in the ticket.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Send credentials securely to the manager, include first-login instructions.

## Escalation decision
Escalate access requests beyond the role template to the approver.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
