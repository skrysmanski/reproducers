#!/usr/bin/env pwsh

Write-Host -ForegroundColor Cyan 'Removing ".git"...'
Remove-Item "$PSScriptRoot/.git" -Recurse -Force

Write-Host -ForegroundColor Cyan 'Removing "init.ps1"...'
Remove-Item "$PSScriptRoot/init.ps1"

Write-Host
Write-Host -ForegroundColor Cyan 'Initializing new Git repository...'
$gitVersion = & git version
if ($gitVersion -ge 'git version 2.28.0') {
    & git init --initial-branch=main "$PSScriptRoot"
}
else {
    & git init "$PSScriptRoot"
}

try {
    # Make sure we're in the right directory.
    Push-Location $PSScriptRoot

    Write-Host
    Write-Host -ForegroundColor Cyan 'Adding skeleton files...'

    # IMPORTANT: We need to use "." here instead of "*" or hidden dot files won't be added
    #   on Linux.
    & git add .

    & git commit -m 'Added repository skeleton'
}
finally {
    Pop-Location
}

Write-Host
Write-Host -ForegroundColor Green 'Done'
