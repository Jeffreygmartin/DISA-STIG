<#
.SYNOPSIS
    Sets machine inactivity timeout to 900 seconds (15 minutes) to lock the system with the screensaver.

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000070).ps1 
#>

# STIG ID: WN10-SO-000070 - Set machine inactivity timeout to 15 minutes (900 seconds)

# Define registry path and target value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$regName = "InactivityTimeoutSecs"
$desiredValue = 900  # 15 minutes

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the value for machine inactivity timeout
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

Write-Output "✔ Machine inactivity timeout set to $desiredValue seconds (15 minutes)."
