# Set my prompt
#function Prompt {
#    $env:USERNAME + "@" + $env:COMPUTERNAME + " " + (Get-Location) + "> "
#}

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

function vagrant_up {
    vagrant up 
}

function vagrant_status {
    vagrant status
}

function vagrant_destroy {
    vagrant destroy
}

function vagrant_suspend {
    vagrant suspend
}

function vagrant_resume {
    vagrant resume
}

Set-Alias -Name less -Value Get-Content
Set-Alias -Name cdg -Value cd_git
Set-Alias -Name cdgl -Value cd_gitlab
Set-Alias -Name cdv -Value cd_vagrant
Set-Alias -Name cdtf -Value cd_p_terraform
Set-Alias -Name vup -Value vagrant_up
Set-Alias -Name vstat -Value vagrant_status
Set-Alias -Name vdes -Value vagrant_destroy
Set-Alias -Name vsus -Value vagrant_suspend
Set-Alias -Name vres -Value vagrant_resume

Import-Module -Name posh-git
Start-SshAgent
Add-SshKey $env:USERPROFILE\.ssh\id_rsa.ppk

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

$GitPromptSettings.WorkingForegroundColor = 'Red'
#$GitPromptSettings.UntrackedForegroundColor = 'Red'
$GitPromptSettings.DefaultForegroundColor = 'Red'
$GitPromptSettings.BranchForegroundColor = 'Red'
$GitPromptSettings.BranchAheadStatusForegroundColor = 'Red'
$GitPromptSettings.LocalDefaultStatusForegroundColor = 'Red'
$GitPromptSettings.AfterForegroundColor = 'White'
$GitPromptSettings.BeforeForegroundColor = 'White'
$GitPromptSettings.BeforeIndexForegroundColor = 'Green'
$GitPromptSettings.BranchIdenticalStatusToForegroundColor = 'Cyan'
$GitPromptSettings.DelimForegroundColor = 'Yellow'
$GitPromptSettings.EnableFileStatus = 'False'
$GitPromptSettings.IndexForegroundColor = 'Green'
$GitPromptSettings.LocalDefaultStatusForegroundColor = 'Green'
$GitPromptSettings.LocalStagedStatusForegroundColor = 'Yellow'
$GitPromptSettings.LocalWorkingStatusForegroundColor = 'Magenta'
$GitPromptSettings.EnableWindowTitle = "~"

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

    #Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
    #Write-Host " : " -NoNewline -ForegroundColor DarkGray
    #Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor Magenta
    #Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $global:LASTEXITCODE = $realLASTEXITCODE
    Write-VcsStatus
    Write-Host "" -NoNewline
    return "> "
}