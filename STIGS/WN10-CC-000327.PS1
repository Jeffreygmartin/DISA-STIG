<#
.SYNOPSIS
    Enables PowerShell Transcription and sets output to a secure log location.

.NOTES
    Author          : Jeffrey Martin
    LinkedIn        : linkedin.com/in/jgm00/
    GitHub          : github.com/Jeffreygmartin
    Date Created    : 2025-06-11
    Last Modified   : 2025-06-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000327

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000327).ps1 
#>

# STIG ID: WN10-CC-000327 - Enable PowerShell Transcription
# This script enables PowerShell Transcription and sets the output directory to a secure location.

# Define the secure output directory for transcripts
$transcriptPath = "C:\Transcripts"

# Create the directory if it doesn't exist
if (-not (Test-Path $transcriptPath)) {
    New-Item -ItemType Directory -Path $transcriptPath -Force | Out-Null
}

# Define the registry path for PowerShell Transcription settings
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Create the registry key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set registry values
Set-ItemProperty -Path $regPath -Name "EnableTranscripting" -Value 1 -Type DWord
Set-ItemProperty -Path $regPath -Name "OutputDirectory" -Value $transcriptPath -Type String

Write-Output "✔ PowerShell Transcription has been enabled."
Write-Output "✔ Transcripts will be saved to: $transcriptPath"
