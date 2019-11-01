#!/bin/sh

kill "$(pstree -lp | grep -- -autostart.sh\([0-9] | sed "s/.*sleep(\([0-9]\+\)).*/\1/")"
