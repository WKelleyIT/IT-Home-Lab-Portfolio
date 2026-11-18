# Lab 9 - Exercise 3: Bulk AD group membership assignment
# Intended environment: corp.example.test, on LAB-DC1
# Reads C:\Lab9\NewHires.csv; maps Department to an existing security group.
# Safe to rerun: membership is checked before attempting an addition.

Import-Module ActiveDirectory -ErrorAction Stop

$csvPath = 'C:\Lab9\NewHires.csv'
if (-not (Test-Path -LiteralPath $csvPath -PathType Leaf)) {
    throw "CSV file not found: $csvPath"
}

$users = @(Import-Csv -LiteralPath $csvPath -ErrorAction Stop)
if ($users.Count -eq 0) { throw 'The CSV contains no employee records.' }
foreach ($column in @('SamAccountName','Department')) {
    if ($column -notin $users[0].PSObject.Properties.Name) {
        throw "Required CSV column missing: $column"
    }
}

# Use the exact security group names from the lab.
$groupMap = @{
    'IT'         = 'GG_IT_Support'
    'Operations' = 'GG_Operations'
}

foreach ($user in $users) {
    $username = ([string]$user.SamAccountName).Trim()
    $department = ([string]$user.Department).Trim()
    $groupName = $groupMap[$department]

    if ([string]::IsNullOrWhiteSpace($username)) {
        Write-Warning 'SKIPPED: CSV row has no username.'
        continue
    }
    if (-not $groupName) {
        Write-Warning "SKIPPED: Unknown department '$department' for $username."
        continue
    }

    try {
        $account = Get-ADUser -Identity $username -ErrorAction Stop
        $group = Get-ADGroup -Identity $groupName -ErrorAction Stop
        $members = @(Get-ADGroupMember -Identity $group.DistinguishedName -ErrorAction Stop)

        if ($members.DistinguishedName -contains $account.DistinguishedName) {
            Write-Host "SKIPPED: $username already belongs to $groupName"
        }
        else {
            Add-ADGroupMember -Identity $group.DistinguishedName -Members $account -ErrorAction Stop
            Write-Host "ADDED: $username to $groupName"
        }
    }
    catch {
        Write-Warning "FAILED: $username -> $groupName - $($_.Exception.Message)"
    }
}
