<#
.SYNOPSIS
    Configures UAC to prompt admins for consent on the secure desktop (ConsentPromptBehaviorAdmin = 2).

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000250

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000250).ps1 
#>

# STIG ID: WN10-SO-000250 - Enforce UAC to Prompt for Consent on Secure Desktop

# Define registry path and required value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$regName = "ConsentPromptBehaviorAdmin"
$desiredValue = 2

# Set the registry value
Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord

Write-Output "✔ UAC policy set: Administrators will be prompted for consent on the secure desktop (ConsentPromptBehaviorAdmin = $desiredValue)."
