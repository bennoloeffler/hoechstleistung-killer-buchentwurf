$ErrorActionPreference = 'Stop'
Push-Location $PSScriptRoot
try {
    $branch = git branch --show-current
    if ($LASTEXITCODE -ne 0 -or $branch -ne 'main') { throw 'Deploy from the main branch.' }
    $changes = git status --porcelain
    if ($LASTEXITCODE -ne 0 -or $changes) { throw 'Commit the website changes before deploying.' }
    $release = git rev-parse HEAD
    if ($LASTEXITCODE -ne 0) { throw 'Could not read the release commit.' }
    git push origin main
    if ($LASTEXITCODE -ne 0) { throw 'Push failed; deployment was stopped.' }
    gh workflow run deploy.yml --repo FlorianGloebl/hoechstleistungskiller-gup --ref main -f "source_sha=$release"
    if ($LASTEXITCODE -ne 0) { throw 'V&S was pushed, but the G&P deployment could not be started. Retry this script.' }
    Write-Output "Both deployments requested for $release. Check GitHub Actions and both live domains."
}
finally {
    Pop-Location
}
