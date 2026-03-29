# 🚀 Git & GitHub Guide

Guida completa e progressiva per imparare Git e GitHub, dalla teoria ai workflow reali.

---

## 📚 Struttura della guida

La guida è divisa in 6 parti:

1. **Fondamenta**
   - Git vs GitHub
   - Setup completo

2. **Workflow base Git**
   - init → add → commit → push

3. **GitHub e repository remoti**
   - Collegamento remoto
   - Uso pratico GitHub

4. **Workflow reali**
   - Branching
   - Markdown
   - Script

5. **Best practices**
   - Naming
   - Struttura repository
   - Workflow professionali

6. **Troubleshooting**
   - Errori comuni
   - Runbook operativo

---

## 🌐 Visualizzazione tramite MkDocs

Questo progetto utilizza **MkDocs** per generare un sito web navigabile.

### ▶️ Avviare in locale

```bash
pip install -r requirements.txt
mkdocs serve
```

Apri nel browser:

```
http://127.0.0.1:8000
```

---

## 📁 Struttura del progetto

```
docs/
├── 01-fondamenta/
├── 02-workflow-base/
├── 03-github-remoto/
├── 04-workflow-reali/
├── 05-best-practices/
└── 06-troubleshooting/
```

---

## 🛠️ Script utili

### 🔄 Sync Git (add + commit + push)

```powershell
.\scripts\git-sync.ps1 -Message "docs: aggiornamento"
```

---

### 📄 Export DOCX

```powershell
.\scripts\export_docx.ps1
```

---

### 📄 Export PDF

```powershell
.\scripts\export_pdf.ps1
```

---

## ⚠️ Note importanti

* La cartella `site/` **NON è versionata** (output MkDocs)
* I contenuti sorgente sono nella cartella `docs/`
* Usa commit chiari:

```bash
docs: aggiunta parte 1
docs: update workflow
```

---

## 🎯 Obiettivo

Questo repository è pensato per:

* 📖 Studio e ripasso
* 🔍 Consultazione veloce
* 🧠 Consolidare conoscenze su Git/GitHub
* 💼 Base per workflow reali

---

## 🚀 Evoluzioni future

* Deploy automatico su GitHub Pages
* Automazione CI/CD
* Espansione documentazione tecnica

---

## 👤 Autore

Creato come guida personale e repository di apprendimento Git.
