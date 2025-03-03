#!/bin/bash

# File per salvare il contatore
CONTATORE_FILE="/tmp/screenshot_counter.txt"

# Leggi il contatore corrente
if [ -f "$CONTATORE_FILE" ]; then
    CONTATORE=$(cat "$CONTATORE_FILE")
else
    CONTATORE=1
fi

# Cattura lo screenshot e salvalo con il nome desiderato
maim --select "/home/metodico/Pictures/Screenshot/$(date +%Y%m%d_%H%M)$CONTATORE.png"

# Copia il file nella clipboard
xclip -selection clipboard -t image/png -i "/home/metodico/Pictures/Screenshot/$(date +%Y%m%d_%H%M)$CONTATORE.png"

# Salva il nuovo contatore
echo $((CONTATORE + 1)) > "$CONTATORE_FILE"

