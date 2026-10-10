# TKT-003: Cannot open shared folder
**Category:** Permissions/AD | **Priority:** P3 | **Status:** Resolved

## Reported issue
'Access is denied' when opening \\\\DC01\\Finance.

## How to reproduce in the lab
Create share `Finance`, grant NTFS+share permission to group `GG-Finance` only. Do NOT add `jdoe` to that group.

## Diagnostics performed
Confirm exact error. `Get-ADPrincipalGroupMembership jdoe`. Check share and NTFS permissions (`icacls D:\\Finance`). Test from another user who has access to confirm scope.

## Root cause
User is not a member of the security group that holds the permission.

## Resolution
Obtain manager approval, then `Add-ADGroupMember -Identity GG-Finance -Members jdoe`. User signs out/in (or `gpupdate /force` + relogin) to refresh the access token.

## Verification
Ask the user (or test on the client) to repeat the failing action and confirm success. Record the result.

## User communication
Explain the access was granted via group membership and a sign-out/in is required.

## Escalation decision
Escalate if access request lacks approval or involves restricted data.

## Evidence (add your own)
- [ ] Screenshot of the problem before the fix
- [ ] Screenshot/command output of the diagnostic step
- [ ] Screenshot/command output proving the fix worked
Save images in `evidence/` and link them here.
