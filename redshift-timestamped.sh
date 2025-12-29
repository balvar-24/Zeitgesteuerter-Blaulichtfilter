#!/bin/bash
#Redshift time control
#Adjusts blue light filter according to the time of day
#7-19  Uhr -> redshift -O 6000
#19-22 Uhr -> redshift -O 4300
#22-7  Uhr -> redshift -O 3600

#Error handling
set -euo pipefail

#Ensure X11 environment is set
export DISPLAY="${DISPLAY:-:0}"
export XAUTHORITY="${XAUTHORITY:-$HOME/.Xauthority}"

#Get the current hour
HOUR=$(date +%H)

#Logging functions
log() {
    echo "[$(date +'%H:%M:%S')] $*" | systemd-cat -t redshift -p info 2>/dev/null || echo "[$(date +'%H:%M:%S')] $*"
}

log_error() {
    echo "[$(date +'%H:%M:%S')] ERROR: $*" | systemd-cat -t redshift -p err 2>/dev/null || echo "[$(date +'%H:%M:%S')] ERROR: $*" >&2
}

#Start log
log "=== redshift-timestamped.sh START (HOUR=$HOUR) ==="
log "Log gestartet..."

#Check if redshift is installed
if ! command -v redshift >/dev/null 2>&1; then
    log_error "redshift ist nicht installiert"
    exit 1
fi

#Reset redshift
log "Resetting..."
redshift -x -m randr >/dev/null 2>&1 || log "Warning: redshift -x failed (perhaps inactive)"

#Determine redshift based on the time of day
if [ "$HOUR" -ge 7 ] && [ "$HOUR" -lt 19 ]; then
    K=6000
    PHASE="day"
elif [ "$HOUR" -ge 19 ] && [ "$HOUR" -lt 22 ]; then
    K=4300
    PHASE="evening"
else
    K=3600
    PHASE="night"
fi

#Log phase
log "Setting blue light filter: $PHASE (${K}K)"

#Set redshift
if redshift -O "$K" -m randr >/dev/null 2>&1; then
    log "Blue light filter set: ${K}K ($PHASE)"
else
    log_error "Could not set the blue light filter"
fi
