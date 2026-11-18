# Wesley Kelley | Windows Server & Infrastructure Home Lab

An evidence-backed portfolio of independent practice in an **isolated virtual lab**. The material documents configuration, troubleshooting, tests, and observed results; it is not presented as production administration.

## Start here

Open **`START_HERE.pdf`** for a concise visual overview. Each project below includes a `PROJECT_SUMMARY.md` and original supporting screenshots or command outputs.

| Area | What is demonstrated |
| --- | --- |
| `01-Windows-Server-AD/` | AD DS structure, domain-joined client, group administration, CSV-driven PowerShell onboarding, replication checks, site/subnet mappings, object recovery, delegated administration, privileged-group inspection, gMSA checks |
| `02-Group-Policy/` | Scope, filtering, inheritance and enforcement practice; workstation `gpresult` evidence |
| `03-DNS-DHCP/` | Forward/reverse DNS, DHCP scopes/reservations/exclusions and resolution of stale records after a static-to-DHCP change |
| `04-File-Services/` | SMB/NTFS group permissions, cross-user tests, controlled access-denied reproduction and least-privilege correction |

## Lab platform

- **Hypervisor:** VMware Workstation Pro
- **Servers:** Windows Server 2025, `LAB-DC1` and `LAB-DC2`
- **Client:** Domain-joined Windows 11 Enterprise test workstation, `LAB-PC1`
- **Directory namespace:** `corp.example.test` (reserved example namespace)
- **Addresses:** Lab-only private IPv4 ranges

## How to evaluate the evidence

1. Read the project summary to understand the objective and the observed outcome.
2. Look at the numbered screenshots together; a settings dialog alone does not establish operational success.
3. Where present, review the original PowerShell commands, diagnostic outputs or troubleshooting notes.
4. Interpret every result as a snapshot at the time of capture, not a claim of ongoing production health.

## Scope and updates

This public edition includes **completed work only**. Planned Linux and integrated-infrastructure projects remain in the private working archive until they have documented results. Earlier duplicate/unsequenced images are also omitted here. A separate FSMO-transfer practice sequence remains in the master copy because its intermediate ownership query did not conclusively show the intended destination controller.

Prepared November 2026. This document is a lab portfolio, not a transcript of the Microsoft assessment.
