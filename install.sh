#!/bin/bash
#Installationscript for redshift time sheduling

set -e

echo "╔══════════════════════════════════╗"
echo "║Redshift time control installation║"
echo "╚══════════════════════════════════╝"
echo ""

#Check if redshift is installed
if ! command -v redshift &> /dev/null; then
    echo "Warning: redshift is not installed"
    echo "Please install it with: sudo apt install redshift"
    echo ""
    read -p "Continue anyway? (j/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Jj]$ ]]; then
        exit 1
    fi
fi

#Create directories
echo "Creating directories..."
mkdir -p ~/.local/bin
mkdir -p ~/.config/systemd/user

#Copy scripts
echo "Copying scripts..."
cp redshift-timestamped.sh ~/.local/bin/
chmod +x ~/.local/bin/redshift-timestamped.sh
echo "Script installed: ~/.local/bin/redshift-timestamped.sh"

#Copy systemd-files
echo "Copying systemd-files..."
cp systemd/redshift-timestamped.service ~/.config/systemd/user/
cp systemd/redshift-timestamped.timer ~/.config/systemd/user/
cp systemd/redshift-login.timer ~/.config/systemd/user/
echo "Service files installed"

#Reload systemd
echo "Reloding systemd..."
systemctl --user daemon-reload

#Enable services
echo "Enabling services..."
systemctl --user enable redshift-timestamped.service
systemctl --user enable redshift-timestamped.timer
systemctl --user enable redshift-login.timer

#Start timer
echo "Starting timer..."
systemctl --user start redshift-timestamped.timer 2>/dev/null || true

#Start service
echo "Starting service..."
systemctl --user start redshift-timestamped.service 2>/dev/null || true

echo ""
echo "╔═══════════════════════╗"
echo "║Installation completed!║"
echo "╚═══════════════════════╝"
echo ""
echo "Check status:"
echo "systemctl --user status redshift-timestamped.service"
echo "systemctl --user list-timers --all"
echo ""
echo "View logs:"
echo "journalctl --user -t redshift -f"
echo "journalctl --user -t redshift --since today"
echo ""
echo "Shedule:"
echo "07:00-19:00 → 6000K (day)"
echo "19:00-22:00 → 4300K (evening)"
echo "22:00-07:00 → 3600K (night)"
