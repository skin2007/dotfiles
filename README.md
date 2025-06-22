# Dotfiles

Benvenuto nel repository **Dotfiles**! Questa repository contiene configurazioni personali per macOS, con setup per **iTerm2**, **SketchyBar**, **SKHD**, **Yabai** e altri strumenti utili. L'obiettivo principale è creare un ambiente organizzato, produttivo e esteticamente gradevole per il tuo sistema.

---

## Indice

1. [Introduzione](#introduzione)
2. [Requisiti](#requisiti)
3. [Struttura della Repository](#struttura-della-repository)
    - [File Principali](#file-principali)
    - [Directory](#directory)
4. [Configurazioni Dettagliate](#configurazioni-dettagliate)
    - [SketchyBar](#sketchybar)
    - [SKHD](#skhd)
    - [Yabai](#yabai)
5. [Script e Automazioni](#script-e-automazioni)
    - [toggle_bar.sh](#toggle_barsh)
6. [Shortcut Complete](#shortcut-complete)
    - [SKHD](#skhd-shortcut)
    - [Yabai](#yabai-shortcut)
7. [Importanza di Yabai e SIP](#importanza-di-yabai-e-sip)
8. [Contributi](#contributi)

---

## Introduzione

Questa repository è progettata per migliorare il workflow su macOS, fornendo strumenti di gestione avanzata per finestre, spazi e barra delle applicazioni. Ogni configurazione è personalizzata per massimizzare la produttività e la coerenza estetica.

---

## Requisiti

- macOS
- Permessi sudo per alcune configurazioni (ad esempio, Yabai)
- Homebrew per installare le dipendenze necessarie
- Familiarità con terminale e script bash

---

## Struttura della Repository

### File Principali

- **LICENSE**: Licenza associata al progetto.
- **README.md**: Questa documentazione.

### Directory

#### `iterm2`
Contiene configurazioni per iTerm2, il terminale avanzato per macOS. File presente:
- **AppSupport**: Link simbolico per supporto applicativo.

#### `sketchybar`
Configurazioni per SketchyBar, una barra delle applicazioni personalizzabile. File e directory:
- **plugins/**: Directory contenente plugin personalizzati.
- **sketchybarrc**: File principale per configurare la barra.

#### `skhd`
Configurazioni per SKHD, un gestore di shortcut per macOS. File presenti:
- **skhdrc**: File di configurazione principale per shortcut personalizzati.
- **toggle_bar.sh**: Script per gestire la barra delle applicazioni.

#### `yabai`
Configurazioni per Yabai, un gestore avanzato di finestre per macOS. File presente:
- **yabairc**: File di configurazione principale.

---

## Configurazioni Dettagliate

### SketchyBar

Il file `sketchybarrc` configura la barra delle applicazioni, includendo:
- Layout personalizzato
- Icone e shortcut per applicazioni
- Temi e colori

### SKHD

Il file `skhdrc` offre una serie di shortcut per gestire finestre, spazi e la barra delle applicazioni. Include anche keybinding per lo script `toggle_bar.sh`.

### Yabai

Il file `yabairc` configura Yabai per:
- Layout bsp (Binary Space Partitioning)
- Gestione di finestre galleggianti
- Configurazioni specifiche per monitor multipli
- Nascondere completamente la barra dei menu di macOS:
  ```bash
  yabai -m config menubar_opacity 0.0
  ```

---

## Script e Automazioni

### `toggle_bar.sh`

Lo script `toggle_bar.sh` automatizza la gestione dinamica della barra delle applicazioni in base al monitor attivo. Funzionamento dettagliato:

1. **Gestione dello stato corrente**:
   - Lo script utilizza un file chiamato `bar_state` per memorizzare lo stato corrente della barra (visibile o nascosta).
   - Se il file non esiste, viene creato e inizializzato con lo stato "visible".

2. **Rilevamento del display attivo**:
   - Lo script utilizza il comando `yabai -m query --displays` per ottenere informazioni sui display.
   - Identifica il display attivo basandosi sugli spazi che contengono finestre aperte.

3. **Alternanza della barra**:
   - **Se la barra è nascosta**:
     - La barra viene resa visibile con `sketchybar --bar hidden=off`.
     - La trasparenza della barra dei menu di macOS viene impostata a `0.0` (completamente nascosta).
     - Configura Yabai per il display attivo:
       - **Monitor interno**: Disattiva la barra esterna (`external_bar all:0:0`).
       - **Monitor esterno**: Attiva la barra esterna con margine (`external_bar all:15:0`).
   - **Se la barra è visibile**:
     - La barra viene nascosta con `sketchybar --bar hidden=on`.
     - La trasparenza della barra dei menu di macOS viene impostata a `1.0` (completamente visibile).
     - Disattiva la configurazione della barra esterna di Yabai (`external_bar all:0:0`).

Esecuzione manuale dello script:
```bash
./toggle_bar.sh
```

---

## Shortcut Complete

### SKHD Shortcut

#### Focus finestre
```plaintext
alt - j  : Focus sulla finestra sotto
alt - k  : Focus sulla finestra sopra
alt - h  : Focus sulla finestra a sinistra
alt - l  : Focus sulla finestra a destra
```

#### Scambio finestre
```plaintext
shift + alt - j  : Scambia con la finestra sotto
shift + alt - k  : Scambia con la finestra sopra
shift + alt - h  : Scambia con la finestra a sinistra
shift + alt - l  : Scambia con la finestra a destra
```

#### Movimento finestre
```plaintext
ctrl + alt - j   : Sposta finestra sotto
ctrl + alt - k   : Sposta finestra sopra
ctrl + alt - h   : Sposta finestra a sinistra
ctrl + alt - l   : Sposta finestra a destra
```

#### Gestione barra delle applicazioni
```plaintext
alt - q  : Toggle della barra
```

#### Gestione Yabai
```plaintext
ctrl + alt - q   : Stop servizio Yabai
ctrl + alt - s   : Start servizio Yabai
ctrl + alt - r   : Restart servizio Yabai
```

### Yabai Shortcut

#### Layout e finestre
```plaintext
alt - s  : Toggle float e centramento
alt - f  : Toggle fullscreen
```

#### Spazi e finestre
```plaintext
alt - 1  : Focus sullo spazio 1
alt - 2  : Focus sullo spazio 2
shift + alt - 1 : Sposta finestra nello spazio 1
shift + alt - 2 : Sposta finestra nello spazio 2
```

---

## Importanza di Yabai e SIP

Per utilizzare **Yabai** con il supporto completo agli spazi e alle finestre, è necessario disattivare parzialmente il **SIP** (System Integrity Protection). Dopo averlo disattivato, esegui:
```bash
sudo yabai --load-sa
```

Questo comando carica il "scripting-addition" di Yabai, necessario per gestire gli spazi dinamici. Per maggiori informazioni su come disattivare il SIP in maniera sicura, consulta la documentazione ufficiale.

---

## Contributi

Se hai suggerimenti o miglioramenti, sentiti libero di aprire una pull request o creare un'issue.

---

Grazie per aver esplorato questa repository! Spero che le configurazioni ti aiutino a migliorare il tuo workflow su macOS.