<#
.SYNOPSIS
    The script sets the DCSettingIndex registry value to 1 to require a password when resuming from sleep on battery.

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000145

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000145).ps1 
#>

# Require password on wake from sleep (on battery) - STIG: WN10-CC-000145
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51"
$valueName = "DCSettingIndex"
$valueData = 1

# Create the key if it doesn't exist
If (-Not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the value
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force

Write-Output "Password prompt on wake from sleep (on battery) has been enabled (STIG: WN10-CC-000145)."
