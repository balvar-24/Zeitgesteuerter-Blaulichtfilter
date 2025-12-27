
# Zeitgesteuerter Blaulichtfilter

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
3. Multi-Monitor Unterstützung (über "xrandr")
4. Bash-Skript zur automatisierten redshift-Setzung abhängig der Uhrzeit
5. Installations- und Deinstallationsskripte für einfache Einrichtung

## Anforderungen:

1. Linux (getestet unter Linux Mint 21.3 "Virginia" Xfce)
2. X11 Unterstützung
3. "redshift"
4. "xrandr" (Multi-Monitor Unterstützung)
5. Systemd-User-Services aktiviert

## Installation:

1. Github-Repo klonen `git clone https://github.com/balvar-24/Zeitgesteuerter-Blaulichtfilter.git`
2. install.sh/uninstall.sh ausführbar machen `chmod +x install.sh uninstall.sh`
3. install.sh ausführen `./install.sh` 

Zum deinstalliern muss `uninstall.sh` ausgeführt werden. Abhängige Dienste, Timer und Configdateien werden wieder gelöscht.
