# Powershell Profile Scripts

- Personal WindowsPowershell Profile
- VSCode WindowsPowershell Profile

## Prerequisits

### Posh-Git
- posh-git from Keith Dahlby
- For detailed Posh-Git description see: https://github.com/dahlbyk/posh-git

### Drill down prerequirement installation in **Elevated** Powershell:
```Install-PackageProvider NuGet -Force```

```Import-PackageProvider NuGet -Force```

```Install-Module -Name PowerShellGet -Force```

```Import-Module -Name PowerShellGet```

```PowerShellGet\Install-Module -Name posh-git -Force```

### For proper SSH-Key usage enable and set OpenSSH-Agent autostart:

```Set-Service -Name ssh-agent -StartupType Automatic```

### OpenSSH-Win64 instead of Windows 10 build-in ###

If you concider problems with ssh-key-based authentication, it's likely the build-in SSH Client of Windows 10.

Workaround:
- Remove the build-in SSH-Client from Windows 10
- Install OpenSSH-Win64, e.g.: ```choco install openssh```
