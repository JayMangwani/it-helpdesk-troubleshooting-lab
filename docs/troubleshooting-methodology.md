# Troubleshooting Methodology

1. **Gather symptoms**: exact error text, when it started, what changed, who else is affected.
2. **Define scope**: one user, one device, one location, or everyone? (Scope points to the layer: user account, device, network, or service.)
3. **Check the basics**: power, cable/Wi-Fi, reboot not as first resort but as a data point.
4. **Diagnose with evidence**: logs (Event Viewer, `/var/log`), configuration (`ipconfig /all`, `Get-ADUser`), connectivity tests.
5. **Form a hypothesis, change ONE thing, test.**
6. **Resolve and verify** with the user, not just on your side.
7. **Document**: symptoms, root cause, steps, resolution.
8. **Escalate** when: outside your permissions, security incident suspected, multiple users impacted, or you've exceeded the time-to-escalate in the matrix.

## Layered model used in this lab
`User/Account -> Device -> Local network (IP/gateway) -> Name resolution (DNS) -> Remote service/application`
Work bottom-up or top-down, but know which layer you're testing.
