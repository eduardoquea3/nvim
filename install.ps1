Remove-Item -Recurse -Force ~/AppData/Local/nvim/config/*

Copy-Item -r $env:HOMEPATH/OneDrive/Documentos/PowerShell/Microsoft.PowerShell_profile.ps1 ~/AppData/Local/nvim/config/
Copy-Item -r $env:HOMEPATH/.config/* ~/AppData/Local/nvim/config/
