# Project 04 - SMB and NTFS File Services

**Objective:** Apply group-based file access, test behavior under different identities, reproduce a permission failure and restore least-privilege access.

**Implementation**

- Configured a departmental SMB share with AD groups controlling NTFS and share access.
- Tested IT read-only access and Operations modification rights using separate accounts.
- Deliberately lowered the Operations share permission to Read; reproduced a file-write access-denied condition.
- Corrected the share and finalized narrower permissions: Operations NTFS Modify, SMB Change + Read; IT Read.

**Evidence:** Screenshots are organized into four stages under `Screenshots/`, with full test narrative in `Project-Notes/Lab_07_Portfolio_Summary.md`. See `Evidence_Index.md` for sequence and caveats.

**Result:** Demonstrated an end-to-end permissions troubleshooting workflow and least-privilege correction. The share resided on a domain controller for the isolated lab exercise only, not as a production recommendation.
