# Guida Git & GitHub – Percorso Completo

# Parte 1/6 – Fondamenta: Git vs GitHub + Setup completo

## 1. Git vs GitHub (capirlo subito ✔️)

| Concetto   | Descrizione                                   |
| ---------- | --------------------------------------------- |
| **Git**    | Sistema di versionamento distribuito (locale) |
| **GitHub** | Piattaforma cloud per ospitare repository Git |

👉 In pratica:

* **Git = strumento CLI sul tuo PC/server**
* **GitHub = server remoto dove salvi e collabori**

💡 Mental model:

```
[ tuo PC ] --git push--> [ GitHub ]
```

---

## 2. Installazione Git (multi-piattaforma)

### 🔹 Linux (Debian/Ubuntu)

```bash
sudo apt update
sudo apt install git -y
```

### 🔹 Linux (RHEL/CentOS)

```bash
sudo dnf install git -y
```

### 🔹 macOS (con Homebrew)

```bash
brew install git
```

### 🔹 Windows (PowerShell)

```powershell
winget install --id Git.Git -e --source winget
```

Oppure scarica da:
👉 [https://git-scm.com](https://git-scm.com)

---

## 3. Verifica installazione

```bash
git --version
```

Output atteso:

```
git version 2.x.x
```

---

## 4. Configurazione iniziale (OBBLIGATORIA)

⚠️ Senza questo Git non funzionerà correttamente per i commit

### Cross-platform (Bash / PowerShell / macOS / Linux)

```bash
git config --global user.name "Mario Rossi"
git config --global user.email "mario@example.com"
```

Verifica:

```bash
git config --list
```

---

## 5. Editor di default (consigliato)

### Linux / macOS (vim o nano)

```bash
git config --global core.editor "nano"
```

### Windows (VS Code)

```powershell
git config --global core.editor "code --wait"
```

---

## 6. Configurazione SSH (fondamentale per GitHub 🔐)

💡 Evita username/password → usa chiavi SSH

---

### 6.1 Genera chiave SSH

#### Linux / macOS / Git Bash

```bash
ssh-keygen -t ed25519 -C "mario@example.com"
```

#### Windows (PowerShell)

```powershell
ssh-keygen -t ed25519 -C "mario@example.com"
```

Premi sempre `Enter` (default path)

---

### 6.2 Avvia SSH agent

#### Linux / macOS

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
```

#### Windows (PowerShell)

```powershell
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

---

### 6.3 Copia chiave pubblica

#### Linux / macOS

```bash
cat ~/.ssh/id_ed25519.pub
```

#### Windows

```powershell
type $env:USERPROFILE\.ssh\id_ed25519.pub
```

👉 Copia output

---

### 6.4 Aggiungi chiave su GitHub

1. Vai su GitHub → Settings
2. SSH and GPG Keys
3. New SSH Key
4. Incolla la chiave

---

### 6.5 Test connessione

```bash
ssh -T git@github.com
```

Output atteso:

```
Hi username! You've successfully authenticated
```

---

## 7. Primo repository locale (hands-on 🔨🤖🔧)

### Scenario reale: repo per script sysadmin

```bash
mkdir sysadmin-scripts
cd sysadmin-scripts
git init
```

Output:

```
Initialized empty Git repository
```

---

## 8. Primo file (esempio Bash)

```bash
echo '#!/bin/bash' > backup.sh
echo 'echo "Backup started"' >> backup.sh
chmod +x backup.sh
```

---

## 9. Stato repository (comando più importante ❗)

```bash
git status
```

Output tipico:

```
Untracked files:
  backup.sh
```

---

## 10. Primo commit

```bash
git add backup.sh
git commit -m "feat: add initial backup script"
```

---

## 📌 Checklist operativa (Parte 1)

* [ ] Git installato
* [ ] User configurato
* [ ] SSH configurato
* [ ] Test SSH OK
* [ ] Repo locale creato
* [ ] Primo commit fatto

---

## 🚨 Errori comuni già qui

### ❌ "Please tell me who you are"

👉 Soluzione:

```bash
git config --global user.name "..."
git config --global user.email "..."
```

---

### ❌ Permesso negato SSH

👉 Controlla:

```bash
ssh -T git@github.com
```

---

### ❌ File non tracciato

👉 Usa:

```bash
git add <file>
```

---

## ✅ Fine Parte 1

Hai ora:

* Git funzionante
* SSH configurato
* Primo repository locale

---

👉 Scrivi **"continua"** per la **Parte 2: Workflow Git completo (init → push)**
