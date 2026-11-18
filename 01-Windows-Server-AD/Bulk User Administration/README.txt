LAB 9 - EXERCISE 3: BULK ACTIVE DIRECTORY ADMINISTRATION

Files:
- Bulk-User-Provisioning.ps1  : Creates missing domain user accounts from CSV.
- Bulk-Group-Assignment.ps1  : Assigns existing accounts to departmental groups.
- NewHires.csv               : Example HR data from the lab.

Target lab: corp.example.test
OU: OU=Lab9-AdminPractice,OU=LabCompany,DC=corp,DC=example,DC=test
Expected groups: GG_IT_Support and GG_Operations

If you want to RUN them in the original lab, copy the CSV to:
  C:\Lab9\NewHires.csv
Then use an elevated Windows PowerShell session on LAB-DC1 with the
ActiveDirectory module available and sufficient AD permissions:
  & 'C:\Lab9\Bulk-User-Provisioning.ps1'
  & 'C:\Lab9\Bulk-Group-Assignment.ps1'

The scripts skip existing accounts or existing direct group membership.
The provisioning script asks for a temporary password only when it finds
users who need to be created. No password is written into the files.

Portfolio tip: Keep the CSV and scripts as source evidence. Store screenshots
of validated AD accounts and group membership separately.
