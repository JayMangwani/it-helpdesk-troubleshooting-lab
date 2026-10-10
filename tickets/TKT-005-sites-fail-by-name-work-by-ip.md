# TKT-005: Sites fail by name, work by IP
**Category:** DNS | **Priority:** P3 | **Status:** Resolved

## Reported issue
'Websites won't load but Teams/other apps sometimes work.'

## How to reproduce in the lab
On the client set DNS server to an unreachable address, e.g. `Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 10.255.255.1`.

## Diagnostics performed
`ping 8.8.8.8` works; `ping google.com` fails. `nslookup google.com` times out. `ipconfig /all` shows wrong DNS server.

## Root cause
Client pointed at an invalid DNS server.

## Resolution
Set DNS correctly (`Set-DnsClientServerAddress -InterfaceAlias Ethernet -ResetServerAddresses` or 192.168.10.10), then `ipconfig /flushdns`. Verify with `nslookup google.com`.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Explain DNS is the internet's address book; it was set to the wrong server. Confirm sites load.

## Escalation decision
Escalate to network team if the correct DNS server is also failing.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
