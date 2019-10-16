#!/bin/bash

WHITE_LIST=("ssh" "tail" "top")

WINDOW_ID=$(xdotool getactivewindow)
TERM_PID=$(xprop -id "$WINDOW_ID" _NET_WM_PID | sed -e 's/_NET_WM_PID(CARDINAL) = \(\d*\)/\1/g')
PARENT_PID=$(pstree -p "$TERM_PID" | grep -o '([0-9]\+)' | grep -o '[0-9]\+' | xargs | rev | cut -d ' ' -f2 | rev)
CMD=$(xargs -0 < /proc/"$PARENT_PID"/cmdline)

if [ ! -z "$WINDOW_ID" ] && [ ! -z "$TERM_PID" ] && [ ! -z "$PARENT_PID" ]; then
    for w in "${WHITE_LIST[@]}"; do
        if [[ ${CMD} =~ ${w}* ]]; then
            EXTRA_ARGS="-e $CMD"
            break
        fi
    done
fi

urxvt -cd "$(xcwd)" $EXTRA_ARGS
