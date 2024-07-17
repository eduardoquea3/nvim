Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String)})
Set-TerminalIconsIcon -FileExtension ".astro" -Glyph "nf-custom-astro"
Set-TerminalIconsIcon -FileExtension ".http" -Glyph "nf-cod-globe"
Set-TerminalIconsIcon -FileExtension ".luacheckrc" -Glyph "nf-seti-lua"


Import-Module PSReadLine
Import-Module Terminal-Icons

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

#Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+j" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Ctrl+e" -Function Acceptline

Set-Alias -Name which -Value where.exe

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
