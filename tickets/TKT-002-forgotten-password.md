# TKT-002: Forgotten password
**Category:** Account/AD | **Priority:** P4 | **Status:** Resolved

## Reported issue
User cannot remember their password.

## How to reproduce in the lab
On the DC: `Set-ADAccountPassword jdoe -Reset -NewPassword (ConvertTo-SecureString 'Temp#Pass123' -AsPlainText -Force)`, then ask for a login attempt with the old password.

## Diagnostics performed
Verify identity first (employee ID / manager confirmation per policy). `Get-ADUser jdoe -Properties PasswordLastSet,Enabled`

## Root cause
User forgot credentials; account is enabled and not locked.

## Resolution
`Set-ADAccountPassword jdoe -Reset -NewPassword ...` then `Set-ADUser jdoe -ChangePasswordAtLogon $true`. Share the temporary password via a secure channel, never in the ticket.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Provide temp password securely, tell user they must change it at first login and the password rules.

## Escalation decision
Escalate if identity cannot be verified.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
