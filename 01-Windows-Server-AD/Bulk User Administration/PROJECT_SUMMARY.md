# Bulk User Administration — Project Summary

**Goal:** Automate creation of test AD users and assignment to departmental security groups.

**Implementation:** `Bulk-User-Provisioning.ps1` reads `NewHires.csv` and creates missing accounts; `Bulk-Group-Assignment.ps1` adds eligible accounts to `GG_IT_Support` and `GG_Operations`. Scripts skip already-existing accounts/membership and do not store a reusable plaintext password in source files.

**Evidence:** Scripts, input CSV, local `README.txt`, and three screenshots of created users and group membership.

**Result:** Demonstrated repeatable AD provisioning plus graphical verification; files remain available for code review and re-running in the isolated lab.
