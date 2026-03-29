# Parte 6/6 – Troubleshooting avanzato + Runbook operativo finale + errori da evitare

Questa è la parte che ti rende **davvero autonomo** 💡
Qui impari a **diagnosticare problemi reali** e ad avere un **runbook pronto all’uso**.

---

# 1. Debug: leggere lo stato del repository 🔍

## 1.1 Stato generale

```bash
git status
```

👉 Ti dice:

* file modificati
* staging area
* branch corrente
* differenze con remoto

---

## 1.2 Cronologia

```bash
git log --oneline --graph --decorate --all
```

---

## 1.3 Differenze

```bash
git diff
```

---

## 1.4 Differenze staged

```bash
git diff --staged
```

---

# 2. Problemi reali + soluzioni

---

## ❌ 2.1 `dubious ownership`

Errore:

```bash
fatal: detected dubious ownership in repository
```

👉 Succede spesso su:

* server condivisi
* Docker
* mount NFS

---

### ✔️ Soluzione

```bash
git config --global --add safe.directory /path/to/repo
```

---

## ❌ 2.2 Problemi autenticazione GitHub

### Caso SSH

Errore:

```bash
Permission denied (publickey)
```

---

### ✔️ Debug

```bash
ssh -T git@github.com
```

---

### ✔️ Fix

```bash
ssh-add ~/.ssh/id_ed25519
```

Windows:

```powershell
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

---

## ❌ 2.3 Remote origin non configurato

Errore:

```bash
fatal: No configured push destination
```

---

### ✔️ Soluzione

```bash
git remote add origin <repo-url>
git push -u origin main
```

---

## ❌ 2.4 Repo divergenti (caso reale ❗)

Errore:

```bash
Updates were rejected
```

---

### ✔️ Soluzione sicura

```bash
git pull --rebase origin main
git push
```

---

## ❌ 2.5 Merge conflict

Errore:

```bash
CONFLICT (content)
```

---

### ✔️ Procedura completa

```bash
git status
nano file
```

Risolvi → poi:

```bash
git add .
git commit -m "fix: resolve merge conflict"
```

---

## ❌ 2.6 Hai committato sul branch sbagliato

---

### ✔️ Fix rapido

```bash
git log
git reset --soft HEAD~1
git checkout correct-branch
git commit -m "feat: moved commit"
```

---

## ❌ 2.7 Vuoi annullare modifiche locali

```bash
git restore file.txt
```

---

## ❌ 2.8 Repo sporco / confuso

```bash
git clean -fd
```

⚠️ cancella file non tracciati

---

# 3. Diagnosi rapida (workflow mentale ✔️)

Quando qualcosa non funziona:

```bash
git status
git log --oneline
git remote -v
```

👉 90% dei problemi si risolve così

---

# 4. RUNBOOK OPERATIVO COMPLETO 🚀

## Scenario: partire da zero

---

## 4.1 Creazione repository locale

```bash
mkdir my-project
cd my-project
git init
```

---

## 4.2 Creazione file

```bash
echo "# My Project" > README.md
```

---

## 4.3 Primo commit

```bash
git add .
git commit -m "feat: initial commit"
```

---

## 4.4 Creazione repo su GitHub

👉 Vai su GitHub → New Repo (senza README)

---

## 4.5 Collegamento remoto

```bash
git remote add origin git@github.com:username/my-project.git
```

---

## 4.6 Primo push

```bash
git push -u origin main
```

---

## 4.7 Modifica file

```bash
echo "New feature" >> README.md
```

---

## 4.8 Commit + push

```bash
git add .
git commit -m "feat: update README"
git push
```

---

# 5. RUNBOOK – Scenario reale sysadmin

## Aggiornare script su server

```bash
git pull
nano script.sh
git add .
git commit -m "fix: improve script logic"
git push
```

---

# 6. Errori da evitare (esperienza reale ❗)

---

## ❌ 6.1 Lavorare sempre su `main`

👉 Problema:

* niente controllo
* rischio produzione

✔️ Usa:

```bash
git checkout -b feature/...
```

---

## ❌ 6.2 Non fare `git pull`

👉 Problema:

* conflitti continui

---

## ❌ 6.3 Usare commit inutili

```bash
git commit -m "update"
```

👉 Dopo 1 mese:
❓ cosa hai cambiato?

---

## ❌ 6.4 Pushare file sensibili

* `.env`
* password
* chiavi SSH

---

## ❌ 6.5 Usare `--force` senza sapere

```bash
git push --force
```

👉 può distruggere lavoro altrui

---

## ❌ 6.6 Ignorare `git status`

👉 È il tuo radar ❗

---

## ❌ 6.7 Repo disordinato

👉 Nessuna struttura = caos

---

# 7. Skill finale acquisita 🎯

Ora sei in grado di:

✔️ Usare Git in modo professionale
✔️ Gestire repository reali
✔️ Lavorare in team
✔️ Risolvere problemi reali
✔️ Versionare script e documentazione

---

# 8. Checklist finale completa ✅

* [ ] Setup Git + SSH
* [ ] Workflow base padroneggiato
* [ ] Uso GitHub OK
* [ ] Branching strategy chiara
* [ ] Repo strutturati bene
* [ ] Debug autonomo
* [ ] Runbook operativo memorizzato

---

# 🏁 Fine guida

Se vuoi fare il livello successivo possiamo andare su:

* Git avanzato (rebase, cherry-pick)
* CI/CD (GitHub Actions)
* Workflow enterprise
* Monorepo vs multirepo
