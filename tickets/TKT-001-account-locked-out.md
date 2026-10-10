# TKT-001: Account locked out
**Category:** Account/AD | **Priority:** P3 | **Status:** Resolved

## Reported issue
User: 'It says my account is locked out and I can't sign in.'

## How to reproduce in the lab
On the DC set lockout policy: Group Policy Management -> Default Domain Policy -> Account Lockout Threshold = 3. On the client, enter a wrong password 3 times for `jdoe`.

## Diagnostics performed
`Get-ADUser jdoe -Properties LockedOut,LockoutTime,BadLogonCount`
Event Viewer (DC) -> Security -> Event ID **4740** (account lockout) shows the source machine.

## Root cause
Repeated bad password attempts exceeded the lockout threshold.

## Resolution
`Unlock-ADAccount -Identity jdoe`. Advise user to sign in with the correct password; check for saved old credentials (Credential Manager, mobile mail) that caused repeat attempts.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Explain that the lockout is a security feature, give the likely trigger (old saved password), confirm login works.

## Escalation decision
Escalate to Security if lockouts recur from an unknown source machine in event 4740.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
