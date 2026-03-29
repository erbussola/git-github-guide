# Parte 5/6 – Best Practice + Struttura Repository + Naming professionale

Qui facciamo il salto di qualità 💡
Non basta “far funzionare Git” → bisogna usarlo **bene, in modo professionale e scalabile**.

---

# 1. Naming dei repository (standard reali ✔️)

## Regole pratiche

* minuscolo
* separatori `-`
* descrittivo
* niente spazi

---

## Esempi corretti

| Tipo repo       | Nome                   |
| --------------- | ---------------------- |
| Script sysadmin | `sysadmin-scripts`     |
| Automation      | `infra-automation`     |
| Docs            | `linux-hardening-docs` |
| Mixed           | `server-setup-toolkit` |

---

## ❌ Errori comuni

* `MyRepo`
* `test123`
* `scripts-final-final`

---

# 2. Naming dei branch (fondamentale)

## Pattern standard:

```id="l08xnl"
feature/<nome>
fix/<nome>
docs/<nome>
chore/<nome>
```

---

## Esempi reali

```bash id="ck6sxe"
git checkout -b feature/backup-rotation
git checkout -b fix/ssh-permission
git checkout -b docs/nginx-setup
```

---

# 3. Naming dei commit (stile professionale)

## Formato consigliato (Conventional Commits)

```id="1f0j5r"
<tipo>: <descrizione breve>
```

---

## Tipi principali

| Tipo     | Uso                  |
| -------- | -------------------- |
| feat     | nuova feature        |
| fix      | bug fix              |
| docs     | documentazione       |
| chore    | manutenzione         |
| refactor | miglioramento codice |

---

## Esempi reali ✔️

```bash id="q00v86"
git commit -m "feat: add automatic backup rotation"
git commit -m "fix: correct permission issue in script"
git commit -m "docs: update nginx configuration guide"
```

---

## ❌ Errori

```bash id="61s9q2"
git commit -m "update"
git commit -m "fix stuff"
```

---

# 4. Struttura repository consigliata

## 4.1 Repository script (sysadmin)

```bash id="zxp0f9"
sysadmin-scripts/
├── scripts/
│   ├── backup.sh
│   ├── cleanup.sh
│   └── monitor.ps1
├── configs/
│   └── nginx.conf
├── logs/        (ignored)
├── README.md
└── .gitignore
```

---

## 4.2 Repository documentazione

```bash id="j1v45l"
infra-docs/
├── README.md
├── linux/
│   ├── hardening.md
│   └── users.md
├── networking/
│   └── firewall.md
```

---

## 4.3 Repository misto (consigliato ✔️)

```bash id="9l5r7n"
project/
├── scripts/
├── docs/
├── configs/
├── README.md
└── .gitignore
```

---

# 5. README.md (fondamentale ❗)

## Struttura minima

```markdown id="81l7k1"
# Project Name

## Description
What this repo does

## Usage
How to run scripts

## Requirements
Dependencies

## Author
Your name
```

---

## Creazione rapida

```bash id="3k3dv1"
echo "# Sysadmin Scripts" > README.md
```

---

# 6. .gitignore avanzato (Linux + scripting)

## Template reale

```bash id="05yxb4"
# Logs
*.log

# Temp files
*.tmp
*.bak

# Swap files
*.swp

# Environment
.env

# OS
.DS_Store
Thumbs.db

# Archives
*.tar.gz
*.zip

# Python
__pycache__/
*.pyc
```

---

# 7. Git tags (versioning reale)

## Scenario: release script

---

## Creare tag

```bash id="0u90wz"
git tag v1.0.0
```

---

## Push tag

```bash id="1q79fu"
git push origin v1.0.0
```

---

## Vedere tag

```bash id="3d7n9f"
git tag
```

---

# 8. Alias Git (produttività 🚀)

## Configurazione

```bash id="uln6qh"
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.cm commit
git config --global alias.br branch
```

---

## Uso

```bash id="s1oqbh"
git st
git co main
```

---

# 9. Workflow professionale consigliato

## Standard operativo ✔️

```bash id="6t21gn"
git checkout main
git pull

git checkout -b feature/new-feature

# lavoro
git add .
git commit -m "feat: add new feature"

git push -u origin feature/new-feature
```

---

# 10. Sicurezza e credenziali

## NON fare mai ❗

* committare `.env`
* salvare password in script
* pushare chiavi private

---

## Controllo rapido

```bash id="tz68qm"
git status
git diff
```

---

# 11. Pulizia repository

## Rimuovere file tracciato per errore

```bash id="1bnwq7"
git rm --cached file.txt
```

---

## Commit

```bash id="rt18u4"
git commit -m "chore: remove sensitive file"
```

---

# 12. Visualizzazione avanzata

## Log grafico

```bash id="x6t6i8"
git log --oneline --graph --decorate --all
```

---

# 📌 Checklist operativa (Parte 5)

* [ ] Sai nominare repo correttamente
* [ ] Sai usare naming branch
* [ ] Sai scrivere commit professionali
* [ ] Sai strutturare repo
* [ ] Sai usare `.gitignore`
* [ ] Sai creare tag
* [ ] Sai usare alias

---

# 🚨 Errori comuni

## ❌ Repo disorganizzato

👉 Problema:

* difficile manutenzione

✔️ Soluzione:

* struttura chiara (`scripts/`, `docs/`, `configs/`)

---

## ❌ Commit vaghi

👉 Problema:

* impossibile capire cambiamenti

---

## ❌ Versioni non tracciate

👉 Problema:

* niente rollback

✔️ Usa:

```bash id="v7wrz7"
git tag v1.0.0
```

---

## ❌ File sensibili nel repo

👉 Gravissimo ❗

✔️ Usa `.gitignore`

---

# 🔚 Fine Parte 5

Ora lavori già come un professionista:

* repo puliti
* commit chiari
* struttura scalabile
* workflow solido

---

👉 Scrivi **"continua"** per la **Parte 6 finale: troubleshooting avanzato + runbook operativo completo + errori da evitare (esperienza reale)**
