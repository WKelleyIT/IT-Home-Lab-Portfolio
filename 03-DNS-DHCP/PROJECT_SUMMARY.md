# Project 03 - DNS and DHCP Administration

**Objective:** Configure address distribution and name resolution, then troubleshoot DNS consistency after a client address transition.

**Implementation**

- Created forward and reverse lookup data; exercised A, CNAME and PTR queries.
- Configured a DHCP scope, reservation, and exclusion range; checked lease information in the server tools and PowerShell.
- Moved `LAB-PC1` from `10.20.30.20` (static) to `10.20.30.100` (reserved DHCP).
- Identified obsolete DNS records left from the earlier static configuration, removed them, and validated final hostname lookups.

**Evidence:** Original setup screenshots and earlier commands are preserved under `Screenshots/` and `Commands/`; the later troubleshooting result is described in `Project-Notes/DNS Troubleshooting Case Study.txt`.

**Result:** Resolved stale record inconsistencies. Historical command output reflecting the previous address is intentionally retained as before-state evidence rather than represented as the final configuration.
