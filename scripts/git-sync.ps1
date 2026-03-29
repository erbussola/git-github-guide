param(
    [string]$Message = "update docs"
)

Write-Host "Checking git repository..."

# Verifica repo Git
if (-not (Test-Path ".git")) {
    Write-Host "ERROR: Non sei dentro un repository Git!"
    exit 1
}

# Controlla modifiche
$status = git status --porcelain

if (-not $status) {
    Write-Host "OK: Nessuna modifica da committare."
    exit 0
}

Write-Host "Adding files..."
git add .

Write-Host "Committing..."
git commit -m "$Message"

# Ottieni branch corrente
$branch = git rev-parse --abbrev-ref HEAD

Write-Host "Pushing to origin/$branch ..."
git push origin $branch

if ($LASTEXITCODE -eq 0) {
    Write-Host "SUCCESS: Push completato!"
} else {
    Write-Host "ERROR: Errore durante il push."
    exit 1
}