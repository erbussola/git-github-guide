# Parte 4/6 – Workflow reali (script, Markdown, branching strategy)

Qui passiamo dalla teoria alla **vita reale da Sysadmin / Infrastructure Engineer** 🔨🤖🔧
Vedrai **casi concreti replicabili**: script, documentazione e lavoro in team.

---

# 1. Workflow reale #1 – Versionamento script Bash

## Scenario

Stai sviluppando uno script di backup che evolve nel tempo.

---

## 1.1 Struttura repo

```bash
sysadmin-scripts/
├── backup.sh
├── cleanup.sh
├── README.md
```

---

## 1.2 Versione iniziale

```bash
echo '#!/bin/bash' > backup.sh
echo 'echo "Backup started"' >> backup.sh
chmod +x backup.sh
```

Commit:

```bash
git add backup.sh
git commit -m "feat: initial backup script"
git push
```

---

## 1.3 Evoluzione reale dello script

Modifica:

```bash
nano backup.sh
```

Nuova versione:

```bash
#!/bin/bash
echo "Backup started"
date
tar -czf backup.tar.gz /home
```

---

## 1.4 Commit significativo ✔️

```bash
git add backup.sh
git commit -m "feat: add tar backup and timestamp"
git push
```

---

## 💡 Best practice commit

❌ Evita:

```bash
git commit -m "update"
```

✔️ Usa:

```bash
git commit -m "feat: add compressed backup with tar"
```

---

# 2. Workflow reale #2 – Script PowerShell (Windows)

## Scenario

Script per gestione servizi

---

## 2.1 File

```powershell
New-Item monitor.ps1
```

Contenuto:

```powershell
Get-Service | Where-Object {$_.Status -eq "Running"}
```

---

## 2.2 Commit

```powershell
git add monitor.ps1
git commit -m "feat: add service monitoring script"
git push
```

---

# 3. Workflow reale #3 – Documentazione tecnica (Markdown)

## Scenario

Documenti configurazioni server

---

## 3.1 Creazione docs

```bash
mkdir docs
cd docs
```

```bash
echo "# Linux Hardening" > linux-hardening.md
```

---

## 3.2 Contenuto reale

```markdown
# Linux Hardening

## Disable root login
Edit /etc/ssh/sshd_config:

PermitRootLogin no
```

---

## 3.3 Commit

```bash
git add .
git commit -m "docs: add linux hardening guide"
git push
```

---

# 4. Branching Strategy (semplice e professionale)

## Modello: `main` + feature branch ✔️

```
main
 ├── feature/backup-improvement
 ├── feature/logging
 └── feature/monitoring
```

---

## 4.1 Workflow completo

### 1. Aggiorna main

```bash
git checkout main
git pull
```

---

### 2. Crea branch

```bash
git checkout -b feature/backup-rotation
```

---

### 3. Lavora

```bash
nano backup.sh
```

---

### 4. Commit

```bash
git add .
git commit -m "feat: add backup rotation logic"
```

---

### 5. Push

```bash
git push -u origin feature/backup-rotation
```

---

### 6. Pull Request (GitHub)

👉 Apri PR → review → merge su `main`

---

# 5. Workflow reale completo (team)

## Caso: lavori con altri admin

---

## Routine giornaliera ✔️

```bash
git checkout main
git pull
git checkout -b feature/new-script
```

---

## Dopo sviluppo

```bash
git add .
git commit -m "feat: add disk monitoring script"
git push
```

---

## Dopo merge PR

```bash
git checkout main
git pull
```

---

# 6. Gestione conflitti (scenario reale)

## Caso:

Due persone modificano `backup.sh`

---

## Errore:

```bash
CONFLICT (content): Merge conflict in backup.sh
```

---

## Risoluzione pratica

```bash
nano backup.sh
```

Sistema manualmente

---

Poi:

```bash
git add backup.sh
git commit -m "fix: resolve backup script conflict"
```

---

# 7. File .gitignore (fondamentale ❗)

## Scenario: evitare file inutili

---

## Esempio `.gitignore` per sysadmin

```bash
echo "*.log" >> .gitignore
echo "*.tmp" >> .gitignore
echo "*.bak" >> .gitignore
echo ".env" >> .gitignore
echo "*.swp" >> .gitignore
```

---

## Commit

```bash
git add .gitignore
git commit -m "chore: add gitignore for logs and temp files"
git push
```

---

# 8. Workflow debugging (uso reale)

## Controlla stato

```bash
git status
```

---

## Vedi cronologia

```bash
git log --oneline
```

---

## Vedi modifiche

```bash
git diff
```

---

# 9. Caso reale: rollback rapido

## Torna a commit precedente

```bash
git log
```

```bash
git checkout <commit_id>
```

---

## Oppure reset

```bash
git reset --hard HEAD~1
```

---

# 📌 Checklist operativa (Parte 4)

* [ ] Sai versionare script Bash
* [ ] Sai versionare PowerShell
* [ ] Sai gestire Markdown
* [ ] Sai usare feature branch
* [ ] Sai lavorare in team
* [ ] Sai risolvere conflitti

---

# 🚨 Errori comuni

## ❌ Lavorare direttamente su `main`

👉 Problema:

* codice instabile
* niente review

✔️ Soluzione:

```bash
git checkout -b feature/...
```

---

## ❌ Non fare `git pull`

👉 Problema:

* conflitti continui

✔️ Soluzione:

```bash
git pull
```

---

## ❌ Commit troppo grandi

👉 Problema:

* difficile debug

✔️ Soluzione:

* commit piccoli e logici

---

## ❌ Non usare `.gitignore`

👉 Problema:

* repo sporco

---

# 🔚 Fine Parte 4

Ora sei già operativo in contesti reali:

* script versionati
* documentazione gestita
* branching professionale
* lavoro in team

---

👉 Scrivi **"continua"** per la **Parte 5: best practice avanzate + struttura repository + naming professionale**
