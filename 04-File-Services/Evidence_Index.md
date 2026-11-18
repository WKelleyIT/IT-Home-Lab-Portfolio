# File Services Evidence Index

The ordered set contains **16 numbered screenshots**, grouped by the stage of the lab. Additional older captures are preserved under `Screenshots/Legacy-Unsequenced/`.

## Initial configuration

| Number | Screenshot | Evidence |
| --- | --- | --- |
| 01 | `01_Initial_Configuration/01_Initial_NTFS_Operations_Full_Control.png` | Initial NTFS permissions for Operations |
| 02 | `01_Initial_Configuration/02_Initial_SMB_IT_Read_Permissions.png` | Initial SMB permissions for IT |
| 03 | `01_Initial_Configuration/03_Initial_SMB_Operations_Full_Control.png` | Initial SMB permissions for Operations |

## User access tests

| Number | Screenshot | Evidence |
| --- | --- | --- |
| 04 | `02_User_Access_Tests/04_Jordan_Share_Access_and_Identity.png` | Operations-user share access and user identity |
| 10 | `02_User_Access_Tests/10_Alex_Share_Access_and_Identity.png` | IT-user share access and user identity |
| 11 | `02_User_Access_Tests/11_Alex_Reads_Operations_Document.png` | IT read-access test |
| 12 | `02_User_Access_Tests/12_Alex_Delete_Attempt_Confirmation.png` | Attempt/confirmation dialog, not independent proof of deletion |
| 13 | `02_User_Access_Tests/13_Alex_File_Access_Denied.png` | Evidence of denied modification/deletion access |

## Controlled troubleshooting

| Number | Screenshot | Evidence |
| --- | --- | --- |
| 05 | `03_Controlled_Troubleshooting/05_Fault_Operations_SMB_Read_Only.png` | Simulated share-permissions fault |
| 06 | `03_Controlled_Troubleshooting/06_Jordan_Attempts_New_File.png` | Operations user attempts file creation |
| 07 | `03_Controlled_Troubleshooting/07_Jordan_Destination_Access_Denied.png` | Access denied during the fault |
| 08 | `03_Controlled_Troubleshooting/08_Jordan_New_File_After_Access_Restored.png` | Creation after permission correction |
| 09 | `03_Controlled_Troubleshooting/09_Jordan_Delete_Confirmation.png` | Confirmation dialog, not independent proof of deletion |

## Final least-privilege configuration

| Number | Screenshot | Evidence |
| --- | --- | --- |
| 14 | `04_Final_Least_Privilege/14_NTFS_Operations_Modify_Setting.png` | Operations NTFS Modify setting |
| 15 | `04_Final_Least_Privilege/15_Final_NTFS_Operations_Modify_IT_Read.png` | Final NTFS permissions for Operations and IT |
| 16 | `04_Final_Least_Privilege/16_Final_SMB_Operations_Change_Read.png` | Final SMB Change/Read permissions |

For the complete project narrative, refer to `Project-Notes/Lab_07_Portfolio_Summary.md`.
