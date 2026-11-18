# Windows File Services: Departmental Permissions and Troubleshooting

**Project:** IT Home Lab — Lab 7, Independent Permissions Assessment  
**Environment:** Windows Server 2025, Windows 11 Enterprise, Active Directory Domain Services, VMware Workstation Pro  
**Domain:** `corp.example.test`  
**File host:** `LAB-DC1` (domain controller used as a file host **for this isolated lab only**)  
**Client:** `LAB-PC1`  
**Network share:** `\\LAB-DC1\OperationsDocs`  
**Local folder:** `C:\LabShares\OperationsDocs`

## Objective

Implement group-based access to a departmental SMB share using both NTFS and share permissions. Operations staff needed read/write/modify/delete capabilities; IT staff needed read-only access. Restrict access using Active Directory security groups and preserve administrative and SYSTEM access.

## Implementation

Created a departmental folder and SMB share on the lab server, and assigned access through the existing `GG_Operations` and `GG_IT_Support` Active Directory groups rather than per-user permissions.

| Group | Final NTFS permissions | Final SMB permissions | Intended effective access over network |
|---|---|---|---|
| `GG_Operations` | Modify | Change + Read | Read, create, edit, delete |
| `GG_IT_Support` | Read (plus List Folder Contents) | Read | Read-only |
| Administrators | Full Control | Full Control | Administrative access |
| SYSTEM | Full Control on NTFS | N/A (local system identity) | System-level local access |

The initial permissions allowed `GG_Operations` Full Control. Following review, reduced this to **NTFS Modify** and **SMB Change + Read** to better follow the principle of least privilege. Kept administrative access intact.

## Validation

Tested access from domain-joined `LAB-PC1` while signed in as two different domain users. Used `whoami` in test screenshots to establish session identity.

- **Alex Rivera (`CORP\arivera`, IT):** Could open and read documents in OperationsDocs but was denied changes that required write/delete access.
- **Jordan Lee (`CORP\jlee`, Operations):** Could access and manage documents with the intended Modify-level permissions. Captured file creation and deletion-test steps; user confirmed the operations succeeded as part of the assessment.

## Controlled troubleshooting scenario

Simulated a ticket reporting that an Operations employee could read documents but could no longer modify them. Temporarily reduced `GG_Operations` **SMB share permission to Read** while leaving NTFS access unchanged. Reproduced the access-denied condition on `LAB-PC1`, identified the share permission as the limiting layer, restored access, and verified the intended workflow.

**Finding:** Effective permissions for a network SMB path depend on *both* NTFS and share-level permissions. Having NTFS Modify does not permit modification when the SMB share is restricted to Read.

## Outcome and skills demonstrated

Completed the independent access-control and troubleshooting exercise; reproduced and remediated a share-level permission fault. Improved the final configuration from broadly functional Full Control to more appropriate group-based least privilege. Skills demonstrated: Active Directory security groups, SMB share administration, NTFS ACLs, permission troubleshooting, user-based validation, and security hardening.

## Evidence

See `Evidence_Index.md` for all **16 original screenshots**, renamed and organized by configuration, user tests, troubleshooting, and final least-privilege settings. Screenshots of confirmation dialogs document attempted actions; they should not be characterized as independent proof of successful deletion.

**Scope note:** This was a controlled home-lab simulation, not production administration. A separate member file server would generally be preferable to hosting departmental shares on a domain controller in production.
