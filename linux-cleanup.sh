#!/bin/sh
# One-off cleanup of what was tried on the Linux PC and dropped: Regolith, then
# i3, the i3-gnome session and Polybar once Sway took over. Run it once on the
# PC after `git pull`, then delete this file:
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

# Optional, by hand, only if the theme, fonts or wallpaper look off afterwards:
# Regolith wrote its look into your GNOME settings. These restore the defaults.
#   for k in gtk-theme icon-theme font-name document-font-name monospace-font-name; do gsettings reset org.gnome.desktop.interface $k; done
#   gsettings reset-recursively org.gnome.desktop.background

# --- i3 and i3-gnome --------------------------------------------------------

# The i3-gnome login session, which its install script copied in by hand, so
# apt doesn't know about it. Backed up first: the session, unit drop-in and
# GNOME defaults are config.
backup=/var/backups/claude/$(date +%Y%m%d-%H%M%S)
files="/usr/bin/i3-gnome /usr/bin/i3-gnome-session
    /usr/share/applications/i3-gnome.desktop
    /usr/share/gnome-session/sessions/i3-gnome.session
    /usr/share/xsessions/i3-gnome.desktop
    /usr/lib/systemd/user/gnome-session@i3-gnome.target.d
    /usr/share/glib-2.0/schemas/90_i3-gnome.gschema.override"
sudo install -d -m 0700 /var/backups/claude
sudo mkdir -p "$backup"
for f in $files; do
    if [ -e "$f" ]; then
        sudo cp -a --parents "$f" "$backup"
    fi
done
sudo rm -rf $files
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
echo "i3-gnome session backed up to $backup"

# Keep what Sway still uses but only came in as a dependency: grim takes the
# screenshots (it came with Flameshot), libnss-myhostname resolves this
# machine's own name.
sudo apt-mark manual grim libnss-myhostname

# i3, its bar, compositor, locker and launcher, Flameshot (it loses focus under
# Sway), and GNOME Flashback, which only hosted i3-gnome.
sudo apt purge i3 i3-wm i3lock i3status suckless-tools polybar picom xss-lock dex xclip flameshot gnome-session-flashback gnome-flashback

# --- Last -------------------------------------------------------------------

# What the removed packages pulled in and nothing else needs.
sudo apt autoremove --purge
