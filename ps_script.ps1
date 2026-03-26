
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent()
# Get the current user's groups
$groups = $user.Groups | For Each-Object { $_.Translate([System.Security.Principal.NTAccount]) } 
# Get the current user's privileges
$privileges = [System.Security.Principal.WindowsIdentity]::GetCurrent().Groups | For Each-Object { $_.Translate([System.Security.Principal.NTAccount]) }
# Output the user information, groups, and privileges in a  text file in the public folder
$output = "User: $($user.Name)`nGroups: $($groups -join ', ')`nPrivileges: $($privileges -join ', ')"
$output | Out-File -FilePath "C:\Users\Public\whoami.txt"
