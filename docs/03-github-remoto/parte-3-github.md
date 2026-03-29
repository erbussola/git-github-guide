# Parte 3/6 – Uso pratico di GitHub + collegamento completo

Ora colleghiamo davvero il tuo lavoro locale a GitHub 🌍
Questa è la parte che **trasforma Git in uno strumento collaborativo reale**.

---

# 1. Creare un repository su GitHub (web)

## Passi:

1. Vai su [https://github.com](https://github.com)
2. Click su **New repository**
3. Compila:

| Campo             | Valore consigliato                          |
| ----------------- | ------------------------------------------- |
| Repository name   | `sysadmin-scripts`                          |
| Description       | `Collection of sysadmin automation scripts` |
| Visibility        | Public / Private                            |
| Initialize README | ❌ NO (importante)                           |

👉 Click su **Create repository**

---

## ⚠️ Perché NON inizializzare con README?

Se lo fai:

* GitHub crea già un commit
* Il tuo repo locale sarà "diverso" → possibili conflitti

---

# 2. Collegare repository locale → GitHub

## Metodo SSH (consigliato ✔️)

### 2.1 Copia URL SSH

Formato:

```bash
git@github.com:username/sysadmin-scripts.git
```

---

### 2.2 Aggiungi remote

```bash
git remote add origin git@github.com:username/sysadmin-scripts.git
```

Verifica:

```bash
git remote -v
```

Output:

```bash
origin  git@github.com:username/sysadmin-scripts.git (fetch)
origin  git@github.com:username/sysadmin-scripts.git (push)
```

---

# 3. Primo push funzionante 🚀

```bash
git push -u origin main
```

Output atteso:

```bash
Enumerating objects...
Writing objects...
To github.com:username/sysadmin-scripts.git
```

👉 Ora il repo è online ✔️

---

# 4. Clonare un repository (scenario reale)

## Caso: lavori su un nuovo server

### Bash / Linux / macOS

```bash
git clone git@github.com:username/sysadmin-scripts.git
cd sysadmin-scripts
```

### PowerShell (Windows)

```powershell
git clone git@github.com:username/sysadmin-scripts.git
cd sysadmin-scripts
```

---

# 5. Workflow reale: aggiornare script

## 5.1 Modifica file

```bash
nano backup.sh
```

---

## 5.2 Commit + push

```bash
git add .
git commit -m "feat: improve backup logging"
git push
```

---

# 6. Repository per documentazione (Markdown)

## Scenario: repo docs infrastruttura

### Struttura:

```bash
docs-infra/
├── README.md
├── networking.md
├── linux-hardening.md
```

---

## 6.1 Creazione file Markdown

```bash
echo "# Infrastructure Docs" > README.md
echo "## Networking" > networking.md
```

---

## 6.2 Commit

```bash
git add .
git commit -m "docs: add initial infrastructure documentation"
git push
```

---

# 7. Repository misto (script + docs)

## Struttura consigliata:

```bash
project/
├── scripts/
│   └── backup.sh
├── docs/
│   └── setup.md
├── README.md
```

---

## Commit esempio:

```bash
git commit -m "feat: add backup script and setup documentation"
```

---

# 8. Pull Request (PR) – introduzione

💡 Le PR sono il cuore del lavoro in team

---

## Workflow reale:

1. Crea branch:

```bash
git checkout -b feature/monitoring
```

2. Modifica + commit:

```bash
git add .
git commit -m "feat: add monitoring script"
```

3. Push:

```bash
git push -u origin feature/monitoring
```

---

4. Vai su GitHub → **Compare & Pull Request**

---

## Cosa succede:

* Revisione codice
* Commenti
* Merge controllato

---

# 9. Pull aggiornamenti (importantissimo ❗)

## Prima di lavorare:

```bash
git pull origin main
```

---

## Caso reale: lavori su server multipli

👉 Sempre fare pull prima di modificare

---

# 10. Autenticazione problemi (GitHub)

## ❌ Errore SSH

```bash
Permission denied (publickey)
```

✔️ Soluzione:

```bash
ssh -T git@github.com
```

Se fallisce:

* chiave non aggiunta
* agent non attivo

---

## ❌ HTTPS chiede password

👉 GitHub NON usa più password

✔️ Usa:

* SSH (consigliato)
* oppure token (PAT)

---

# 11. Verifica stato remoto vs locale

```bash
git status
```

Esempio:

```bash
Your branch is ahead of 'origin/main' by 1 commit
```

---

# 12. Comandi fondamentali GitHub-ready

```bash
git remote -v
git push
git pull
git fetch
```

---

# 📌 Checklist operativa (Parte 3)

* [ ] Repo creato su GitHub
* [ ] Remote configurato
* [ ] Primo push riuscito
* [ ] Sai clonare repo
* [ ] Sai fare update + push
* [ ] Sai creare PR

---

# 🚨 Errori comuni

## ❌ Remote già esistente

```bash
fatal: remote origin already exists
```

✔️ Soluzione:

```bash
git remote remove origin
git remote add origin <url>
```

---

## ❌ Divergenza repo

```bash
hint: Updates were rejected
```

✔️ Soluzione:

```bash
git pull --rebase origin main
git push
```

---

## ❌ Hai pushato sul branch sbagliato 😬

✔️ Soluzione:

```bash
git log
git reset --hard HEAD~1
git push --force
```

⚠️ Attenzione: forza modifica storia

---

# 🔚 Fine Parte 3

Ora sai:

* usare GitHub davvero
* collegare repo locale
* fare push/pull reali
* usare PR base

---

👉 Scrivi **"continua"** per la **Parte 4: workflow reali (script, Markdown, branching strategy da sysadmin)**
