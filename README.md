# IT Help Desk Troubleshooting Lab

A simulated help-desk environment covering password/account issues, network connectivity, DNS, software, and Windows troubleshooting, plus basic Active Directory user and group administration.

## Environment
| Component | Details |
|---|---|
| Hypervisor | VirtualBox (free) |
| Domain Controller | Windows Server 2022 Evaluation (AD DS, DNS, DHCP) |
| Client | Windows 10/11 VM joined to the domain `lab.local` |
| Ticketing | Markdown tickets in `/tickets` (same fields as a real ITSM tool) |

Setup steps: [docs/lab-setup.md](docs/lab-setup.md)

## Method
Every ticket follows: **Symptoms -> Scope -> Diagnostics (logs/config) -> Root cause -> Resolution -> Verification -> User communication -> Escalation decision.** See [docs/troubleshooting-methodology.md](docs/troubleshooting-methodology.md).

## Tickets
| ID | Issue | Category |
|---|---|---|
| TKT-001 | Account locked out | Account/AD |
| TKT-002 | Forgotten password | Account/AD |
| TKT-003 | Cannot open shared folder | Permissions/AD |
| TKT-004 | No network (169.254.x.x address) | Network/DHCP |
| TKT-005 | Sites fail by name, work by IP | DNS |
| TKT-006 | Application crashes on launch | Software |
| TKT-007 | PC running very slowly | Windows |
| TKT-008 | Windows Update failing | Windows |
| TKT-009 | Connected to LAN but no internet | Network/Gateway |
| TKT-010 | New hire account setup | AD administration |

## Repo layout
```
docs/       methodology, escalation matrix, communication templates, lab setup
templates/  blank ticket template
tickets/    10 ticket write-ups
scripts/    PowerShell for AD administration
evidence/   YOUR screenshots (add as you complete each ticket)
```

## Status
Update this table as you finish each ticket (be honest, partially complete is fine).
| Ticket | Reproduced | Resolved | Evidence added |
|---|---|---|---|
| TKT-001 | [ ] | [ ] | [ ] |
