#!/bin/sh
# Starts Polybar for i3: at login and on an i3 restart (exec_always in the
# session configs), and from the reload key in i3/flow. Running it again is
# how the bars follow a monitor being plugged in or removed.

monitors=$(polybar --list-monitors)

# One bar per monitor, like i3bar. The tray can only exist once: it goes on
# the widest monitor, where the work happens. The primary one wins a tie.
tray=$(echo "$monitors" | awk '{
    split($2, size, "x"); score = size[1] * 2 + (/\(primary\)/ ? 1 : 0)
    if (score > best) { best = score; name = $1 }
} END { sub(":", "", name); print name }')
want=$(for m in $(echo "$monitors" | cut -d: -f1); do
    [ "$m" = "$tray" ] && echo "$m:main" || echo "$m:side"
done | sort)

# The bars running now, in the same form. Leave them alone when they match.
have=$(for pid in $(pgrep -x polybar); do
    echo "$(tr '\0' '\n' < "/proc/$pid/environ" | sed -n 's/^MONITOR=//p'):$(tr '\0' '\n' < "/proc/$pid/cmdline" | tail -1)"
done | sort)
[ "$want" = "$have" ] && exit

pkill -x polybar
while pgrep -x polybar >/dev/null; do sleep 0.1; done

# The battery and charger are named differently per machine.
BAR_BATTERY=$(ls /sys/class/power_supply 2>/dev/null | grep -m1 '^BAT')
BAR_ADAPTER=$(ls /sys/class/power_supply 2>/dev/null | grep -m1 -E '^(AC|ADP)')
export BAR_BATTERY BAR_ADAPTER

# --reload makes a bar pick up edits to config.ini by itself.
for entry in $want; do
    MONITOR=${entry%%:*} polybar --reload "${entry##*:}" &
done
