# TKT-009: Connected to LAN but no internet
**Category:** Network/Gateway | **Priority:** P3 | **Status:** Resolved

## Reported issue
'I can reach local things but not the internet.'

## How to reproduce in the lab
Set a wrong default gateway on the client: `New-NetRoute`/change adapter static IP gateway to `192.168.10.99`.

## Diagnostics performed
`ipconfig /all` (check gateway); `ping <gateway>` fails; `ping 192.168.10.10` works; `tracert 8.8.8.8` dies at first hop.

## Root cause
Incorrect default gateway configured.

## Resolution
Correct the gateway (or switch the adapter back to DHCP), verify `ping 8.8.8.8` and `ping google.com`.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Confirm internet works; explain the wrong setting was a manual configuration.

## Escalation decision
Escalate to network team if the correct gateway is itself unreachable.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
