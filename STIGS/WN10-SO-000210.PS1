<#
.SYNOPSIS
    Configures LDAP client signing requirements to at least "Negotiate signing" (LDAPClientIntegrity = 1).

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000210

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000210).ps1 
#>

# STIG ID: WN10-SO-000210 - Configure LDAP client signing to "Negotiate signing"

# Define registry path and desired setting
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LDAP"
$regName = "LDAPClientIntegrity"
$desiredValue = 1  # 1 = Negotiate signing, 2 = Require signing

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the LDAP client signing requirement
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

Write-Output "✔ LDAP client signing level set to 'Negotiate signing' (LDAPClientIntegrity = $desiredValue)."
