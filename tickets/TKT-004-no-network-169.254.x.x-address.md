# TKT-004: No network (169.254.x.x address)
**Category:** Network/DHCP | **Priority:** P3 | **Status:** Resolved

## Reported issue
'No internet, the network icon shows a warning.'

## How to reproduce in the lab
Stop the DHCP Server service on the DC (`Stop-Service DHCPServer`), then on the client run `ipconfig /release` and `ipconfig /renew`.

## Diagnostics performed
`ipconfig /all` shows an APIPA 169.254.x.x address and no gateway. Check cable/adapter, then check whether other devices also fail (scope), then check DHCP service on the server.

## Root cause
DHCP server unavailable, so client self-assigned an APIPA address.

## Resolution
Start the DHCP service (`Start-Service DHCPServer`), then on client `ipconfig /release && ipconfig /renew`. Verify a 192.168.10.x lease.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Tell user connectivity is restored and cause was a server-side service, no action on their side.

## Escalation decision
If multiple users affected, treat as P2 and escalate to the network/server team right away.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
