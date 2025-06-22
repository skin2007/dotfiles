#!/bin/bash

# File per memorizzare lo stato corrente
STATE_FILE="$HOME/.config/skhd/bar_state"

# Ottieni informazioni sui display
displays=$(yabai -m query --displays)

# Trova il display attivo basandosi su ID e focus
active_display=$(echo "$displays" | jq -r '.[] | select(.spaces | length > 0) | .id')

# Verifica se il file di stato esiste, altrimenti crealo e imposta lo stato iniziale
if [[ ! -f "$STATE_FILE" ]]; then
    echo "visible" > "$STATE_FILE"
fi

# Leggi lo stato corrente dal file
current_state=$(cat "$STATE_FILE")

# Alterna la configurazione in base allo stato corrente
if [[ "$current_state" == "hidden" ]]; then
    echo "La barra è nascosta. Attivazione barra visibile."
    sketchybar --bar hidden=off
    echo "visible" > "$STATE_FILE"  # Aggiorna lo stato nel file
    yabai -m config menubar_opacity 0.0

    if [[ "$active_display" == "1" ]]; then
        echo "Monitor interno rilevato (ID: $active_display). Configura barra per monitor interno."
        yabai -m config external_bar all:0:0
    else
        echo "Monitor esterno rilevato (ID: $active_display). Configura barra per monitor esterno."
        yabai -m config external_bar all:15:0
    fi
else
    echo "La barra è visibile. Attivazione barra nascosta."
    sketchybar --bar hidden=on
    echo "hidden" > "$STATE_FILE"  # Aggiorna lo stato nel file
    yabai -m config menubar_opacity 1.0
    yabai -m config external_bar all:0:0
fi
