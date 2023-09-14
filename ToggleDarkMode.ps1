Set-PSDebug -Off
$SystemUsesLightTheme = Get-ItemPropertyValue -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme

$EnableLightTheme = 1
if ($SystemUsesLightTheme){
    $EnableLightTheme = 0
}
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value $EnableLightTheme -Type Dword -Force;
New-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value $EnableLightTheme -Type Dword -Force