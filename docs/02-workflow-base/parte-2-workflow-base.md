# Parte 2/6 – Workflow base Git (init → push)

Ora entriamo nel **cuore operativo di Git** 🔨🤖🔧
Imparerai il flusso corretto usato ogni giorno da sysadmin e dev.

---

## 🧠 Mental Model del Workflow Git

Working Directory → Staging Area → Repository (commit)

| Fase                 | Comando      |
| -------------------- | ------------ |
| Modifica file        | editor       |
| Aggiunta             | `git add`    |
| Salvataggio versione | `git commit` |
| Invio remoto         | `git push`   |

---

# 1. Workflow base completo (end-to-end)

## Scenario reale:

Stai modificando uno script Bash per backup.

---

## 1.1 Modifica file

```bash
nano backup.sh
```

Esempio modifica:

```bash
#!/bin/bash
echo "Backup started"
date
```

---

## 1.2 Controlla stato

```bash
git status
```

Output:

```bash
modified: backup.sh
```

---

## 1.3 Vedi differenze (fondamentale ❗)

```bash
git diff
```

👉 Ti mostra esattamente cosa hai cambiato

---

## 1.4 Aggiungi allo staging

```bash
git add backup.sh
```

Oppure tutto:

```bash
git add .
```

---

## 1.5 Commit

```bash
git commit -m "feat: add timestamp to backup script"
```

💡 Naming corretto:

* `feat:` nuova feature
* `fix:` bug fix
* `docs:` documentazione
* `refactor:` miglioramento codice

---

# 2. Branching (fondamentale in ambienti reali)

## 2.1 Crea nuovo branch

```bash
git branch feature/logging
```

---

## 2.2 Spostati nel branch

```bash
git checkout feature/logging
```

Oppure (moderno ✔️):

```bash
git switch feature/logging
```

---

## 2.3 Shortcut (crea + entra)

```bash
git checkout -b feature/logging
```

---

## 2.4 Modifica file nel branch

```bash
echo 'echo "Log saved"' >> backup.sh
```

```bash
git add .
git commit -m "feat: add logging message"
```

---

## 2.5 Torna su main

```bash
git switch main
```

---

## 2.6 Merge del branch

```bash
git merge feature/logging
```

---

# 3. Merge Conflict (caso reale ❗)

## Scenario:

Hai modificato lo stesso file su due branch

---

## 3.1 Esempio conflitto

Git mostra:

```bash
<<<<<<< HEAD
echo "Backup started"
=======
echo "Backup BEGIN"
>>>>>>> feature/logging
```

---

## 3.2 Risoluzione manuale

Modifica file:

```bash
echo "Backup started"
echo "Log saved"
```

---

## 3.3 Finalizza merge

```bash
git add backup.sh
git commit -m "fix: resolve merge conflict in backup script"
```

---

# 4. Collegare repository remoto (GitHub)

⚠️ Qui prepariamo il push (nella Parte 3 lo faremo completo)

---

## 4.1 Aggiungi remote

```bash
git remote add origin git@github.com:username/sysadmin-scripts.git
```

Verifica:

```bash
git remote -v
```

---

# 5. Push (prima volta)

```bash
git push -u origin main
```

💡 `-u` = collega branch locale al remoto

---

# 6. Pull (aggiornarsi dal remoto)

```bash
git pull origin main
```

---

# 7. Log e ispezione (debug essenziale 🔍)

## Cronologia commit

```bash
git log --oneline --graph --all
```

---

## Differenze tra commit

```bash
git diff HEAD~1
```

---

## Stato completo

```bash
git status
```

---

# 8. Workflow completo (riassunto rapido ✔️)

```bash
# modifica file
nano backup.sh

# controlla
git status
git diff

# salva
git add .
git commit -m "feat: update backup logic"

# invia
git push
```

---

# 📌 Checklist operativa (Parte 2)

* [ ] Sai leggere `git status`
* [ ] Sai usare `git diff`
* [ ] Sai fare commit corretti
* [ ] Sai creare branch
* [ ] Sai fare merge
* [ ] Sai risolvere conflitti

---

# 🚨 Errori comuni

## ❌ `git push` senza remote

Errore:

```bash
fatal: No configured push destination
```

✔️ Soluzione:

```bash
git remote add origin <repo-url>
git push -u origin main
```

---

## ❌ `git push` branch sbagliato

Errore:

```bash
error: src refspec main does not match any
```

✔️ Controlla:

```bash
git branch
```

---

## ❌ Merge fatto sul branch sbagliato 🤦‍♂️

✔️ Soluzione:

```bash
git log
git reset --hard HEAD~1
```

⚠️ ATTENZIONE: distrugge modifiche

---

## ❌ Hai dimenticato `git add`

Errore:

```bash
nothing to commit
```

✔️ Soluzione:

```bash
git add .
git commit -m "..."
```

---

# 🔚 Fine Parte 2

Ora sai:

* workflow completo Git
* branching reale
* merge e conflitti
* preparazione al push

---

👉 Scrivi **"continua"** per la **Parte 3: GitHub reale + collegamento completo + primo push funzionante**
