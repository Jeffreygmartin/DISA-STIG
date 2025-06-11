<#
.SYNOPSIS
    Disables PKU2U authentication using online identities (AllowOnlineID = 0).

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000185

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000185).ps1 
#>

# STIG ID: WN10-SO-000185 - Prevent PKU2U authentication using online identities

# Define registry path and required secure value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\LSA\pku2u"
$regName = "AllowOnlineID"
$desiredValue = 0

# Create the registry path if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the registry value to disable PKU2U online identity use
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

Write-Output "✔ PKU2U authentication using online identities has been disabled (AllowOnlineID = $desiredValue)."
