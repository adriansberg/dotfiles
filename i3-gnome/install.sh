#!/bin/sh
# Installs the "i3-gnome" login session: i3 as the window manager inside
# GNOME's Flashback session, so GNOME keeps handling function keys, power,
# sound, the lock screen and Settings.
#
#   sudo sh i3-gnome/install.sh            install
#   sudo sh i3-gnome/install.sh uninstall  remove
#
# The session files are from github.com/mbaynton/i3-gnome, branch ubuntu-24.04
# (MIT, see LICENSE). This script does what its Makefile does.
set -eu

[ "$(id -u)" = 0 ] || { echo "run this with sudo" >&2; exit 1; }

here=$(cd "$(dirname "$0")" && pwd)
units=/usr/lib/systemd/user
dropin=$units/gnome-session@i3-gnome.target.d
schemas=/usr/share/glib-2.0/schemas

if [ "${1-}" = uninstall ]; then
    rm -f /usr/bin/i3-gnome /usr/bin/i3-gnome-session \
          /usr/share/applications/i3-gnome.desktop \
          /usr/share/gnome-session/sessions/i3-gnome.session \
          /usr/share/xsessions/i3-gnome.desktop
    rm -rf "$dropin"
    rm -f "$schemas/90_i3-gnome.gschema.override"
    glib-compile-schemas "$schemas"
    exit 0
fi

ubuntu=$units/gnome-session@ubuntu.target.d/ubuntu.session.conf
[ -f "$ubuntu" ] || { echo "missing $ubuntu: this needs an Ubuntu desktop install" >&2; exit 1; }
[ -f "$units/gnome-flashback.target" ] || { echo "run first: sudo apt install gnome-session-flashback" >&2; exit 1; }

install -m0755 -D "$here/i3-gnome" /usr/bin/i3-gnome
install -m0755 -D "$here/i3-gnome-session" /usr/bin/i3-gnome-session
install -m0644 -D "$here/i3-gnome.desktop" /usr/share/applications/i3-gnome.desktop
install -m0644 -D "$here/i3-gnome.session" /usr/share/gnome-session/sessions/i3-gnome.session
install -m0644 -D "$here/i3-gnome-xsession.desktop" /usr/share/xsessions/i3-gnome.desktop

# GNOME starts its services through systemd. Take Ubuntu's own list of them,
# drop the requirement for GNOME Shell and ask for Flashback instead.
mkdir -p "$dropin"
{ grep -v '^Requires=org.gnome.Shell.target' "$ubuntu"; echo "Wants=gnome-flashback.target"; } > "$dropin/i3-gnome.session.conf"
chmod 0644 "$dropin/i3-gnome.session.conf"

# Session-only GNOME defaults, such as moving the lock key off Win+L.
install -m0644 -D "$here/90_i3-gnome.gschema.override" "$schemas/90_i3-gnome.gschema.override"
glib-compile-schemas "$schemas"

echo 'Installed. Log out and pick "i3-gnome" under the gear icon on the login screen.'
