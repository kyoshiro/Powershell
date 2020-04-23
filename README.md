# Powershell Profile Scripts

- Personal WindowsPowershell Profile
- VSCode WindowsPowershell Profile

## Prerequisits

### Posh-Git
- posh-git from https://github.com/dahlbyk/posh-git
- For detailed Posh-Git description see documentation at

### Drill down prerequirement installation in **elevated** Powershell:
```Install-PackageProvider NuGet -Force```

```Import-PackageProvider NuGet -Force```

```Install-Module -Name PowerShellGet -Force```

```Import-Module -Name PowerShellGet```

```PowerShellGet\Install-Module -Name posh-git -Force```

### For proper SSH-Key usage enable and set OpenSSH-Agent autostart:

```Set-Service -Name ssh-agent -StartupType Automatic```
