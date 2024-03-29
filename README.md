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

### OpenSSH-Win64 instead of Windows 10/11 build-in ###

If you concider problems with ssh-key-based authentication, it's likely the build-in SSH Client of Windows 10/11.

Workaround:
- Remove the build-in SSH-Client from Windows 10/11
- Install OpenSSH-Win64, e.g.: ```choco install openssh```

# ToggleDarkMode with AutoHotKey

The scriptings provided here do the following:
- `AutoHotKey.ahk` is a small config file to create a KeyBinding to do something, e.g. execute a script as in this case it will do with `<CTRL>+<ALT>+d` it will run the also provided `RunPowerShellHidden.vbs` script with `ToggleDarkMode.ps1` as target powershell script.
- As mentioned, `RunPowerShellHidden.vbs` will exactly do what it stands for, it will execute a powershell script provided as a parameter without opening a powershell window. This is a workaround, as running powershell directly even with parameter `-WindowMode Hidden` will still show a powershell window for a short moment on execution.
- The script `ToggleDarkMode.ps1` will also do exactly what it stands for, it will check wether Windows Theme Dark is enabled or not and switches to the opposite.
- Please make sure to keep scriptings in the same folder and do not move them around after creating the shortcut for Startup (see below).
- When everything is fine you can easily switch between Dark and Light Theme by the defined KeyBinding. Enjoy!

## Prerequisits

### Install AutoHotKey

- To install AutoHotKey in Windows use your preferred way, either download from Website https://www.autohotkey.com/ and install AutoHotKey
- or e.g. as in my case install via Chocolatey by ```choco install autohotkey```

### Add `AutoHotKey.ahk` to Startup
- Move into the folder where you downloaded these files
- Right-click on the file `AutoHotKey.ahk` and select `Create shortcut`
- Press <WIN>-Key and type `run+<ENTER>` - a small window should prompt for entering a command to execute
- Type `shell:startup+<ENTER>` - the Startup item folder should open in a new windows
- Move the previous created shortcut of `AutoHotKey.ahk` into the Startup folder

