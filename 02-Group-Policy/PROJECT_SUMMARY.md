# Project 02 - Group Policy Administration

**Objective:** Explore GPO scope, filtering, inheritance and enforcement, and verify policy application for a user session.

**Implementation:** Created a domain sign-in message and targeted user restrictions; compared users and OUs; configured link enforcement and inheritance scenarios in Group Policy Management Console.

**Evidence:** The `Screenshots/Inheritance Test/` images show GPO link/enforcement configuration and a test user's `gpresult` output. `Commands/Workstation-GPO-Verification.txt` identifies the active lab user and the applied vs. filtered GPOs at the time of capture.

**Result:** Demonstrated how to check the difference between policies being linked and actually applying to a particular session.

**Scope:** `gpresult /r` lists applied GPOs for the account/session; it does not prove which individual setting won every possible policy conflict. This is an educational lab.
