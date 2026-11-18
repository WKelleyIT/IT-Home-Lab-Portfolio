# Project 01 - Windows Server and Active Directory

**Objective:** Build an isolated AD DS environment, manage users and groups, automate onboarding, and verify directory infrastructure state.

**Environment:** Two Windows Server 2025 lab domain controllers (`LAB-DC1`, `LAB-DC2`), Windows 11 Enterprise client (`LAB-PC1`), domain `corp.example.test`, hosted in VMware Workstation Pro.

**Implementation**

- Installed and verified AD DS/DNS; organized test OUs, security groups, and departmental user accounts; joined a client to the domain.
- Wrote PowerShell scripts for CSV-based account provisioning and group assignment. The input is fictional lab data; the provisioning script requests a temporary password using `Read-Host -AsSecureString` instead of embedding it in source.
- Collected replication diagnostics with `repadmin`; the captured summary shows 0 failures across 5 checks for each controller at that moment.
- Configured AD site and subnet objects and inspected DC placement and post-change replication; `Branch-Lab` and `BranchOffice` are distinct sites.
- Documented an AD Recycle Bin object recovery exercise, delegated group membership, privileged-group inspection, and gMSA validation.

**Verification:** See topic-specific `PROJECT_SUMMARY.md` files, numbered screenshots, script source and replication text reports.

**Result:** Practiced identity lifecycle, automation, site topology, recovery, replication diagnostics and security administration in a small virtual domain.

**Evidence boundary:** An earlier FSMO role-transfer sequence is retained only in the private master because its immediate ownership query remained inconclusive. No claim of successfully validating that transfer is made here. None of these exercises involved a production domain.
