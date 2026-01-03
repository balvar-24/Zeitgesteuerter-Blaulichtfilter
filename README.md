# Scheduled Blue Light Filter [eng]

This program automatically applies a blue light filter
on Linux desktops. It is controlled using dedicated systemd timers,
which trigger a service that runs a bash script.

## Features

1. Automatic blue light filter activation on login
2. Time-based adjustments via systemd timer:
   - 7:00 AM – 7:00 PM → `redshift -O 6000`
   - 7:00 PM – 10:00 PM → `redshift -O 4300`
   - 10:00 PM – 7:00 AM → `redshift -O 3600`
3. Bash script to automatically set redshift based on time
4. Installation and uninstallation scripts for easy setup

## Requirements

1. Linux (tested on Linux Mint 21.3 "Virginia" Xfce)
2. X11 support
3. Systemd user services enabled

## Installation

1. Clone the GitHub repository: `git clone https://github.com/balvar-24/Scheduled-Blue-Light-Filter.git`
2. Make `install.sh` and `uninstall.sh` executable: `chmod +x install.sh uninstall.sh`
3. Run the installation script: `./install.sh` 

To uninstall, simply run `uninstall.sh`. All dependent services, timers, and configuration files will be removed.

---

# Zeitgesteuerter Blaulichtfilter [ger]

Das angefügte Programm setzt automatisiert einen Blaulichtfilter
auf Linux-Desktops.
Gesteuert wird das Programm mit dedizierten systemd-Timern,
die einen Service auslösen, der wiederum ein bash Skript ausführt.

## Funktionen:

1. Automatisches Setzen des Blaulichtfilters nach Login
2. Zeitgesteuerte Anpassung via systemd-Timer:
- 7-19  Uhr  -> redshift -O 6000
- 19-22 Uhr -> redshift -O 4300
- 22-7  Uhr  -> redshift -O 3600
3. Bash-Skript zur automatisierten redshift-Setzung abhängig der Uhrzeit
4. Installations- und Deinstallationsskripte für einfache Einrichtung

## Anforderungen:

1. Linux (getestet unter Linux Mint 21.3 "Virginia" Xfce)
2. X11 Unterstützung
3. Systemd user Services aktiviert

## Installation:

1. Github-Repo klonen `git clone https://github.com/balvar-24/Scheduled-Blue-Light-Filter.git`
2. install.sh/uninstall.sh ausführbar machen `chmod +x install.sh uninstall.sh`
3. install.sh ausführen `./install.sh` 

Zum deinstalliern muss `uninstall.sh` ausgeführt werden. Abhängige Dienste, Timer und Configdateien werden wieder gelöscht.
