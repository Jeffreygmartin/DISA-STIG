<#
.SYNOPSIS
    Prevents sending unencrypted (plain text) passwords to third-party SMB servers (EnablePlainTextPassword = 0).

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000110

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000110).ps1 
#>

# STIG ID: WN10-SO-000110 - Disable sending unencrypted passwords to third-party SMB servers

# Define registry path and secure value
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$regName = "EnablePlainTextPassword"
$desiredValue = 0

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Apply the secure setting
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

Write-Output "✔ Disabled sending unencrypted passwords to third-party SMB servers (EnablePlainTextPassword = $desiredValue)."
