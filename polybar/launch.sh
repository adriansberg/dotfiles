#!/bin/sh
# Starts Polybar for i3: at login and on an i3 restart (exec_always in the
# session configs), and from the reload key in i3/flow. Running it again is
# how the bars follow a monitor being plugged in or removed.

monitors=$(polybar --list-monitors)

# Every monitor already has its bar: leave them running.
[ "$(pgrep -x polybar | wc -l)" -eq "$(echo "$monitors" | wc -l)" ] && exit

pkill -x polybar
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# The battery and charger are named differently per machine.
BAR_BATTERY=$(ls /sys/class/power_supply 2>/dev/null | grep -m1 '^BAT')
BAR_ADAPTER=$(ls /sys/class/power_supply 2>/dev/null | grep -m1 -E '^(AC|ADP)')
export BAR_BATTERY BAR_ADAPTER

# One bar per monitor, like i3bar. The tray can only exist once: it goes on
# the primary monitor, or on the first one when none is marked primary.
# --reload makes a bar pick up edits to config.ini by itself.
primary=$(echo "$monitors" | awk -F: '/\(primary\)/{print $1; exit}')
[ -n "$primary" ] || primary=$(echo "$monitors" | head -1 | cut -d: -f1)
for m in $(echo "$monitors" | cut -d: -f1); do
    [ "$m" = "$primary" ] && bar=main || bar=side
    MONITOR=$m polybar --reload "$bar" &
done
