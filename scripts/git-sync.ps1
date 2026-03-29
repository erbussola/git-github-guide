param(
    [string]$Message = "update docs"
)

Write-Host "Checking git repository..."

if (-not (Test-Path ".git")) {
    Write-Host "ERROR: Non sei in un repo Git"
    exit 1
}

# Controllo modifiche
$status = git status --porcelain

if (-not $status) {
    Write-Host "OK: Nessuna modifica"
    exit 0
}

# 🔥 BUILD MKDOCS PRIMA DEL COMMIT
Write-Host "Running MkDocs build (validation)..."

mkdocs build
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: MkDocs build fallita. Correggi gli errori prima del push."
    exit 1
}

Write-Host "MkDocs build OK"

# Git flow
Write-Host "Adding files..."
git add .

Write-Host "Committing..."
git commit -m "$Message"

$branch = git rev-parse --abbrev-ref HEAD

Write-Host "Pushing to origin/$branch..."
git push origin $branch

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: Push completato!"
} else {
    Write-Host "ERROR: Push fallito"
    exit 1
}