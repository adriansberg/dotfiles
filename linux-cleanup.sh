#!/bin/sh
# One-off cleanup of what was tried on the Linux PC and dropped. Run it once
# on the PC after `git pull`, then delete this file:
#
#   sh linux-cleanup.sh
#
# apt shows what it will remove and asks first. Read each list; answering n
# stops the script. Running it again is harmless.
set -e

# --- Regolith ---------------------------------------------------------------

# Its packages and their settings.
pkgs=$(dpkg-query -W -f '${Package} ${Version}\n' | awk '/regolith/{print $1}')
[ -z "$pkgs" ] || sudo apt purge $pkgs

# Its package source and signing key.
sudo rm -f /etc/apt/sources.list.d/regolith.list /usr/share/keyrings/regolith-archive-keyring.gpg
sudo apt update

# Notification pop-ups. Installing Regolith removed dunst, and removing
# Regolith does not bring it back. Must come before autoremove, which
# otherwise takes xdg-utils along.
sudo apt install dunst

# Its config folder.
rm -rf ~/.config/regolith3

# Optional, by hand, only if the theme, fonts or wallpaper look off afterwards:
# Regolith wrote its look into your GNOME settings. These restore the defaults.
#   for k in gtk-theme icon-theme font-name document-font-name monospace-font-name; do gsettings reset org.gnome.desktop.interface $k; done
#   gsettings reset-recursively org.gnome.desktop.background

# --- Last -------------------------------------------------------------------

# What the removed packages pulled in and nothing else needs.
sudo apt autoremove --purge
