Invoke-Expression (&starship init powershell)
# import extras of me
. C:\Users\eduar\OneDrive\Documentos\PowerShell\alias.ps1

# imports Modules
Invoke-Expression (& { (zoxide init powershell | Out-String)})
fnm env --use-on-cd | Out-String | Invoke-Expression
Set-TerminalIconsIcon -FileExtension ".astro" -Glyph "nf-custom-astro"
Set-TerminalIconsIcon -FileExtension ".http" -Glyph "nf-cod-globe"
Set-TerminalIconsIcon -FileExtension ".luacheckrc" -Glyph "nf-seti-lua"


Import-Module PSReadLine
Import-Module git-aliases -DisableNameChecking
Import-Module Terminal-Icons

Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+k" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key "Ctrl+j" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Ctrl+e" -Function Acceptline

Set-Alias -Name which -Value where.exe
Set-Alias -Name tree -Value tre.exe
Set-Alias -Name ls -Value list
Set-Alias -Name la -Value listAll

function list () {
  eza --icons $args
}

function listAll () {
  eza --icons -a $args
}

$env:BAT_THEME="Catppuccin Mocha"

