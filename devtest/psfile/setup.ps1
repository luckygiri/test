Enable-PSRemoting –Force -SkipNetworkProfileCheck
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
# Install

Start-Process "C:\SoftwaresDump\QTP12.5\setup.exe"
Start-Process "C:\SoftwaresDump\QTP12.5\qtpsetup.exe"
