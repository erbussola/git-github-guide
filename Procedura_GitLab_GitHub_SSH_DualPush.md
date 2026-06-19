# Configurazione GitLab + GitHub con Commit SSH Signed e Doppio Push

## Obiettivo

Configurare Git su Windows per:

- Firmare i commit tramite chiave SSH
- Ottenere commit `Verified` su GitLab e GitHub
- Utilizzare GitLab come repository principale
- Utilizzare GitHub come repository secondario (backup)
- Effettuare un unico push verso entrambi i repository
- Evitare la richiesta della passphrase ad ogni operazione Git tramite `ssh-agent`

---

## Prerequisiti

## Software

- Windows 10/11
- Git for Windows
- OpenSSH Client Windows

## Account

- Account GitLab
- Account GitHub

## Chiavi

- Coppia di chiavi SSH dedicata al signing già creata
- Chiave pubblica registrata su GitLab
- Chiave pubblica registrata su GitHub

---

## Configurazione SSH

## File

`C:\Users\<utente>\.ssh\config`

Contenuto:

```text
Host gitlab.com
    User git
    IdentityFile ~/.ssh/id_gitlab_signing
    IdentitiesOnly yes

Host github.com
    User git
    IdentityFile ~/.ssh/id_gitlab_signing
    IdentitiesOnly yes
```

---

## Configurazione ssh-agent

## Rischio ssh-agent

SAFE

## PowerShell come Amministratore

Verifica stato:

```powershell
Get-Service -Name ssh-agent
```

Se non è in stato Running e Automatic:

```powershell
Set-Service -Name ssh-agent -StartupType Automatic
Start-Service -Name ssh-agent
```

---

## PowerShell come Utente

Caricare la chiave:

```powershell
ssh-add C:\Users\<utente>\.ssh\id_gitlab_signing
```

Verifica:

```powershell
ssh-add -l
```

Output atteso:

```text
256 SHA256:<fingerprint> <utente> (ED25519)
```

---

## Configurazione Git Globale

## Rischio Git Globale

SAFE

```powershell
git config --global core.sshCommand "C:\Windows\System32\OpenSSH\ssh.exe"

git config --global user.name "ErBussola"
git config --global user.email "f.biscossi@gmail.com"

git config --global gpg.format ssh
git config --global commit.gpgsign true

git config --global user.signingkey C:\Users\<utente>\.ssh\id_gitlab_signing.pub

git config --global gpg.ssh.program C:\Windows\System32\OpenSSH\ssh-keygen.exe

git config --global gpg.ssh.allowedSignersFile C:\Users\<utente>\.ssh\allowed_signers
```

---

## File allowed_signers

## Rischio allowed_signers

SAFE

File:

```text
C:\Users\<utente>\.ssh\allowed_signers
```

Contenuto:

```text
erbussola ssh-ed25519 <chiave_pubblica>
```

Importante:

- Salvare con terminazione Unix (LF)
- Non utilizzare terminazioni Windows (CRLF)

---

## Registrazione Chiave su GitLab

## SSH Key

Menu:

```text
User Settings
SSH Keys
```

Utilizzo:

```text
Authentication & Signing
```

---

## Registrazione Chiave su GitHub

## Authentication Key

```text
Settings
SSH and GPG Keys
New SSH Key
Key Type: Authentication Key
```

## Signing Key

```text
Settings
SSH and GPG Keys
New SSH Key
Key Type: Signing Key
```

La stessa chiave pubblica può essere utilizzata per entrambe le funzioni.

---

## Verifiche SSH

## GitLab

```powershell
ssh -T git@gitlab.com
```

Output atteso:

```text
Welcome to GitLab, @username!
```

## GitHub

```powershell
ssh -T git@github.com
```

Output atteso:

```text
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

---

## Clonazione Nuovo Repository

## Rischio clonazione

SAFE

Directory contenitore:

```powershell
mkdir C:\RepositoryGit
cd C:\RepositoryGit
```

Clone da GitLab:

```powershell
git clone git@gitlab.com:<utente>/<repository>.git
```

Entrare nel repository:

```powershell
cd <repository>
```

---

## Configurazione Doppio Push

## Rischio doppio push

LOW RISK

### Configurazione standard

GitLab = repository principale

```powershell
git remote set-url origin git@gitlab.com:<utente>/<repository>.git

git remote set-url --add --push origin git@gitlab.com:<utente>/<repository>.git

git remote set-url --add --push origin git@github.com:<utente>/<repository>.git
```

Verifica:

```powershell
git remote -v
```

Output atteso:

```text
origin  git@gitlab.com:<utente>/<repository>.git (fetch)

origin  git@gitlab.com:<utente>/<repository>.git (push)

origin  git@github.com:<utente>/<repository>.git (push)
```

---

## Conversione Repository da HTTPS a SSH

## Rischio conversione HTTPS

LOW RISK

```powershell
git remote set-url origin git@gitlab.com:<utente>/<repository>.git

git remote set-url --delete --push origin https://gitlab.com/<utente>/<repository>.git

git remote set-url --delete --push origin https://github.com/<utente>/<repository>.git

git remote set-url --add --push origin git@gitlab.com:<utente>/<repository>.git

git remote set-url --add --push origin git@github.com:<utente>/<repository>.git
```

Verifica:

```powershell
git remote get-url --push --all origin
```

Output atteso:

```text
git@gitlab.com:<utente>/<repository>.git
git@github.com:<utente>/<repository>.git
```

---

## Test Commit Firmato

## Rischio test commit firmato

SAFE

```powershell
git commit --allow-empty -S -m "Verification test"
```

Verifica:

```powershell
git show --show-signature HEAD
```

---

## Push

Branch main:

```powershell
git push origin main
```

Branch master:

```powershell
git push origin master
```

Il push verrà eseguito automaticamente verso:

- GitLab
- GitHub

---

## Operatività Quotidiana

```powershell
git add .

git commit -m "Descrizione modifica"

git push origin main
```

oppure:

```powershell
git push origin master
```

---

## Verifiche Finali

Verifica firma:

```powershell
git show --show-signature HEAD
```

Verifica chiave caricata:

```powershell
ssh-add -l
```

Verifica remoti:

```powershell
git remote -v
```

Verifica push multiplo:

```powershell
git remote get-url --push --all origin
```

---

## Risultato Finale

Configurazione validata:

- Commit SSH Signed
- Commit Verified su GitLab
- Commit Verified su GitHub
- GitLab repository principale
- GitHub repository secondario
- Doppio push automatico
- Utilizzo di OpenSSH Windows
- Utilizzo di ssh-agent
- Nessuna richiesta ripetuta della passphrase dopo corretta inizializzazione dell'agent
