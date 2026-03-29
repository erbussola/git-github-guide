Write-Host "Installing mkdocs-with-pdf..."
pip install mkdocs-with-pdf

Write-Host "Building MkDocs site..."
mkdocs build

Write-Host "PDF export pronto (plugin mkdocs-with-pdf)"