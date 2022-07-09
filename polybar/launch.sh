#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar


# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 0.1; done


# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
# polybar one 2>&1 | tee -a /tmp/polybar1.log & disown
polybar two 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar cnt 2>&1 | tee -a /tmp/polybar2.log & disown
# polybar lft 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar rgt 2>&1 | tee -a /tmp/polybar3.log & disown

echo "Bars launched..."
