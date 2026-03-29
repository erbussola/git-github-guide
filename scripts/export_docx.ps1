$Output = "git-guide.docx"

Write-Host "Generating DOCX with Pandoc..."

pandoc `
  docs/index.md `
  docs/01-introduction/*.md `
  docs/02-basics/*.md `
  docs/03-branching/*.md `
  docs/04-remote/*.md `
  docs/05-advanced/*.md `
  docs/06-best-practices/*.md `
  -o $Output

Write-Host "DOCX generato: $Output"