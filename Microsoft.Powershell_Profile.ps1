# Personal PowerShell Profile
# Author: Roman Asendorf
#
# Features:
# - Aliases for useful directory and command shortcuts
# - Prompt modification similar to bash
# - Prompt modification with Git Prompt integration based on Posh-Git
# - SSH Agent and SSH Add-Key based on Posh-Git
#
# For detailed Posh-Git description see documentation at: 
# https://github.com/dahlbyk/posh-git
#
# Prerequisits:
# Install-PackageProvider NuGet -Force
# Import-PackageProvider NuGet -Force
# Install-Module -Name PowerShellGet -Force
# Import-Module -Name PowerShellGet
#
# Install Posh-Git
# PowerShellGet\Install-Module -Name posh-git -Force
# Enable and Autostart OpenSSH-Agent Service

# Directory shortcut functions
function cd_git {
    Set-Location -Path $env:HOMEPATH/Develop/git
}
function cd_gitlab {
    Set-Location -Path $env:HOMEPATH/Develop/gitlab
}
function cd_vagrant {
    Set-Location -Path $env:HOMEPATH/Develop/gitlab/NIS/vagrant
}
function cd_p_terraform {
    Set-Location -Path $env:HOMEPATH/Develop/gitlab/NSD/p_terraform
}

# Vagrant shortcut functions
function vagrant_destroy {
    vagrant destroy $args
}
function vagrant_reload {
    vagrant reload $args
}
function vagrant_resume {
    vagrant resume $args
}
function vagrant_ssh {
    vagrant ssh $args
}
function vagrant_status {
    vagrant status $args
}
function vagrant_suspend {
    vagrant suspend $args
}
function vagrant_up {
    vagrant up $args
}

# Alias Definitions
Set-Alias -Name less -Value Get-Content

Set-Alias -Name cdg -Value cd_git
Set-Alias -Name cdgl -Value cd_gitlab
Set-Alias -Name cdv -Value cd_vagrant
Set-Alias -Name cdtf -Value cd_p_terraform

Set-Alias -Name vdes -Value vagrant_destroy
Set-Alias -Name vrel -Value vagrant_reload
Set-Alias -Name vres -Value vagrant_resume
Set-Alias -Name vssh -Value vagrant_ssh
Set-Alias -Name vstat -Value vagrant_status
Set-Alias -Name vsus -Value vagrant_suspend
Set-Alias -Name vup -Value vagrant_up

# Enable Emacs ReadLine
Set-PSReadlineOption -EditMode Emacs

# Modifying the Prompt with Posh-Git

[bool] $PoshGitAvailable = $False

if(!(Get-Module -ListAvailable -Name posh-git)) {
    Write-Host "The Module 'Posh-Git' is not installed. Git Prompt will not work without it."
    Write-Host "Install 'Posh-Git' from https://github.com/dahlbyk/posh-git"
    Write-Host "Continuing without Git Prompt for the moment."
} else {
    Import-Module -Name posh-git
    $PoshGitAvailable = $True
}

If($PoshGitAvailable){
    # Adding SSH Key to SSH Agent
    Start-SshAgent
    Add-SshKey $env:USERPROFILE\.ssh\id_rsa.ppk
}

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

If($PoshGitAvailable){
# Git Prompt Settings
    $GitPromptSettings.DefaultForegroundColor                    = 'Red'
    #$GitPromptSettings.BeforeText                                = '['
    $GitPromptSettings.BeforeForegroundColor                     = 'White'
    #$GitPromptSettings.BeforeBackgroundColor                     = ''
    #$GitPromptSettings.DelimText                                 = '|'
    $GitPromptSettings.DelimForegroundColor                      = 'Yellow'
    #$GitPromptSettings.DelimBackgroundColor                      = ''
    #$GitPromptSettings.AfterText                                 = ']'
    $GitPromptSettings.AfterForegroundColor                      = 'White'
    #$GitPromptSettings.AfterBackgroundColor                      = ''
    #$GitPromptSettings.FileAddedText                             = '+'
    #$GitPromptSettings.FileModifiedText                          = '~'
    #$GitPromptSettings.FileRemovedText                           = '-'
    #$GitPromptSettings.FileConflictedText                        = '!'
    #$GitPromptSettings.LocalDefaultStatusSymbol                  = ''
    $GitPromptSettings.LocalDefaultStatusForegroundColor         = 'Green'
    $GitPromptSettings.LocalDefaultStatusForegroundBrightColor   = 'Green'
    #$GitPromptSettings.LocalDefaultStatusBackgroundColor         = ''
    #$GitPromptSettings.LocalWorkingStatusSymbol                  = '!'
    $GitPromptSettings.LocalWorkingStatusForegroundColor         = 'Magenta'
    $GitPromptSettings.LocalWorkingStatusForegroundBrightColor   = 'Red'
    #$GitPromptSettings.LocalWorkingStatusBackgroundColor         = ''
    #$GitPromptSettings.LocalStagedStatusSymbol                   = '~'
    $GitPromptSettings.LocalStagedStatusForegroundColor          = 'Yellow'
    #$GitPromptSettings.LocalStagedStatusBackgroundColor          = ''
    #$GitPromptSettings.BranchUntrackedSymbol                     = ''
    $GitPromptSettings.BranchForegroundColor                     = 'Red'
    #$GitPromptSettings.BranchBackgroundColor                     = ''
    #$GitPromptSettings.BranchGoneStatusSymbol                    = '×'
    $GitPromptSettings.BranchGoneStatusForegroundColor           = 'DarkCyan'
    #$GitPromptSettings.BranchGoneStatusBackgroundColor           = ''
    #$GitPromptSettings.BranchIdenticalStatusToSymbol             = '≡'
    $GitPromptSettings.BranchIdenticalStatusToForegroundColor    = 'Cyan'
    #$GitPromptSettings.BranchIdenticalStatusToBackgroundColor    = ''
    #$GitPromptSettings.BranchAheadStatusSymbol                   = '↑'
    $GitPromptSettings.BranchAheadStatusForegroundColor          = 'Red'
    #$GitPromptSettings.BranchAheadStatusBackgroundColor          = ''
    #$GitPromptSettings.BranchBehindStatusSymbol                  = '↓'
    $GitPromptSettings.BranchBehindStatusForegroundColor         = 'Red'
    #$GitPromptSettings.BranchBehindStatusBackgroundColor         = ''
    #$GitPromptSettings.BranchBehindAndAheadStatusSymbol          = '↕'
    $GitPromptSettings.BranchBehindAndAheadStatusForegroundColor = 'Yellow'
    #$GitPromptSettings.BranchBehindAndAheadStatusBackgroundColor = ''
    #$GitPromptSettings.BeforeIndexText                           = ''
    $GitPromptSettings.BeforeIndexForegroundColor                = 'Green'
    $GitPromptSettings.BeforeIndexForegroundBrightColor          = 'Green'
    #$GitPromptSettings.BeforeIndexBackgroundColor                = ''
    $GitPromptSettings.IndexForegroundColor                      = 'Green'
    $GitPromptSettings.IndexForegroundBrightColor                = 'Green'
    #$GitPromptSettings.IndexBackgroundColor                      = ''
    $GitPromptSettings.WorkingForegroundColor                    = 'Red'
    $GitPromptSettings.WorkingForegroundBrightColor              = 'Red'
    #$GitPromptSettings.WorkingBackgroundColor                    = ''
    #$GitPromptSettings.EnableStashStatus                         = 'False'
    #$GitPromptSettings.BeforeStashText                           = '('
    #$GitPromptSettings.BeforeStashBackgroundColor                = ''
    $GitPromptSettings.BeforeStashForegroundColor                = 'Red'
    #$GitPromptSettings.AfterStashText                            = ')'
    #$GitPromptSettings.AfterStashBackgroundColor                 = ''
    $GitPromptSettings.AfterStashForegroundColor                 = 'Red'
    #$GitPromptSettings.StashBackgroundColor                      = ''
    $GitPromptSettings.StashForegroundColor                      = 'Red'
    $GitPromptSettings.ErrorForegroundColor                      = 'Red'
    #$GitPromptSettings.ErrorBackgroundColor                      = ''
    #$GitPromptSettings.ShowStatusWhenZero                        = 'True'
    #$GitPromptSettings.UntrackedFilesMode                        = ''
    #$GitPromptSettings.AutoRefreshIndex                          = 'True'
    #$GitPromptSettings.BranchBehindAndAheadDisplay               = 'Full'
    #$GitPromptSettings.EnablePromptStatus                        = 'True'
    #$GitPromptSettings.EnableFileStatus                          = 'False'
    #$GitPromptSettings.EnableFileStatusFromCache                 = 'False'
    #$GitPromptSettings.RepositoriesInWhichToDisableFileStatus    = '{}'
    #$GitPromptSettings.DescribeStyle                             = ''
    $GitPromptSettings.EnableWindowTitle                         = '~'
    #$GitPromptSettings.AdminTitlePrefixText                      = 'Administrator: '
    #$GitPromptSettings.DefaultPromptPrefix                       = ''
    #$GitPromptSettings.DefaultPromptSuffix                       = '$('>' * ($nestedPromptLevel + 1)) '
    #$GitPromptSettings.DefaultPromptDebugSuffix                  = '[DBG]$('>' * ($nestedPromptLevel + 1)) '
    #$GitPromptSettings.DefaultPromptEnableTiming                 = 'False'
    #$GitPromptSettings.DefaultPromptPath                         = '$(Get-PromptPath)'
    #$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory      = 'False'
    #$GitPromptSettings.Debug                                     = 'False'
    #$GitPromptSettings.BranchNameLimit                           = '0'
    #$GitPromptSettings.TruncatedBranchSuffix                     = '...'
}
function prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    Write-Host
    
    # Reset color, which can be messed up by Enable-GitColors
    #$Host.UI.RawUI.ForegroundColor = White

    if (Test-Administrator) {  # Use different username if elevated
       Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }

    Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor Green
    Write-Host "$ENV:COMPUTERNAME " -NoNewline -ForegroundColor Green

    if ($s -ne $null) {  # color for PSSessions
        Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
        Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
        Write-Host ") " -NoNewline -ForegroundColor DarkGray
    }

    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
    #Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor Magenta
 
    $global:LASTEXITCODE = $realLASTEXITCODE
    If($PoshGitAvailable){
        Write-VcsStatus
    }
    Write-Host "" -NoNewline
    return "> "
}