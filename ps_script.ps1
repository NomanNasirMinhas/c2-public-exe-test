$user = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$groups = $user.Groups | ForEach-Object { 
    try { 
        $_.Translate([System.Security.Principal.NTAccount]).Value 
    } catch { 
        $_.Value
    } 
}

$privileges = (whoami /priv /fo csv | ConvertFrom-Csv) | Select-Object -ExpandProperty "Privilege Name"

$output = "User: $($user.Name)`nGroups: $($groups -join ', ')`nPrivileges: $($privileges -join ', ')"
$output | Out-File -FilePath "C:\Users\Public\whoami.txt"