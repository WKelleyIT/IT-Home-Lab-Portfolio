# Lab 9 - Exercise 3: Bulk Active Directory user provisioning
# Intended environment: corp.example.test, on LAB-DC1
# Input: C:\Lab9\NewHires.csv (GivenName,Surname,SamAccountName,Department,Title)
# This script skips existing accounts and never stores a plaintext password.

Import-Module ActiveDirectory -ErrorAction Stop

$csvPath = 'C:\Lab9\NewHires.csv'
$ou = 'OU=Lab9-AdminPractice,OU=LabCompany,DC=corp,DC=example,DC=test'
$upnSuffix = 'corp.example.test'

if (-not (Test-Path -LiteralPath $csvPath -PathType Leaf)) {
    throw "CSV file not found: $csvPath"
}

# Confirm the target OU exists before making any changes.
Get-ADOrganizationalUnit -Identity $ou -ErrorAction Stop | Out-Null

$users = @(Import-Csv -LiteralPath $csvPath -ErrorAction Stop)
if ($users.Count -eq 0) { throw 'The CSV contains no employee records.' }

$requiredColumns = @('GivenName','Surname','SamAccountName','Department','Title')
foreach ($column in $requiredColumns) {
    if ($column -notin $users[0].PSObject.Properties.Name) {
        throw "Required CSV column missing: $column"
    }
}

# Check all usernames before prompting for a password.
$pending = @()
foreach ($user in $users) {
    $username = [string]$user.SamAccountName
    $username = $username.Trim()
    $displayName = (('{0} {1}' -f $user.GivenName, $user.Surname)).Trim()

    if ($username -notmatch '^[a-zA-Z0-9._-]{1,20}$') {
        Write-Warning "SKIPPED: Invalid or missing username '$username' for '$displayName'."
        continue
    }
    if ([string]::IsNullOrWhiteSpace($user.GivenName) -or [string]::IsNullOrWhiteSpace($user.Surname)) {
        Write-Warning "SKIPPED: Missing name for '$username'."
        continue
    }

    try {
        $existingByUsername = Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction Stop
        if ($existingByUsername) {
            Write-Host "SKIPPED: $username already exists."
            continue
        }

        # A previous failed script can leave an account with the right full name
        # but an incorrect sAMAccountName. Do not try to recreate that object.
        $existingByName = Get-ADUser -Filter "Name -eq '$displayName'" -SearchBase $ou -ErrorAction Stop
        if ($existingByName) {
            Write-Warning "SKIPPED: '$displayName' already exists in the practice OU under username '$($existingByName.SamAccountName)'. Review it manually."
            continue
        }

        $pending += $user
    }
    catch {
        Write-Warning "FAILED to validate '$username': $($_.Exception.Message)"
    }
}

if ($pending.Count -eq 0) {
    Write-Host 'No new accounts to create.'
    return
}

$password = Read-Host 'Enter temporary password for new lab accounts' -AsSecureString

foreach ($user in $pending) {
    $username = ([string]$user.SamAccountName).Trim()
    $displayName = (('{0} {1}' -f $user.GivenName, $user.Surname)).Trim()

    try {
        New-ADUser `
            -Name $displayName `
            -GivenName $user.GivenName `
            -Surname $user.Surname `
            -SamAccountName $username `
            -UserPrincipalName "$username@$upnSuffix" `
            -Department $user.Department `
            -Title $user.Title `
            -Path $ou `
            -AccountPassword $password `
            -Enabled $true `
            -ChangePasswordAtLogon $true `
            -ErrorAction Stop

        $account = Get-ADUser -Identity $username -ErrorAction Stop
        if ($account.Enabled) {
            Write-Host "CREATED: $username (enabled; password change required at first sign-in)."
        }
        else {
            Write-Warning "CHECK: $username was created but is disabled. Verify its password meets domain policy."
        }
    }
    catch {
        Write-Warning "FAILED: $username - $($_.Exception.Message). Check whether a partial user object exists before retrying."
    }
}

# Remove the password variable from the script's scope.
Remove-Variable password -ErrorAction SilentlyContinue
