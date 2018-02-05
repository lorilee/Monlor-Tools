#!/bin/ash
#copyright by monlor
monlorpath=$(uci -q get monlor.tools.path) || exit 1
if [ -f $monlorpath/apps/verysync/bin/verysync ]; then
	result=$(md5sum $monlorpath/apps/verysync/bin/verysync | cut -d' ' -f1)
	[ "$result" == "e44951c35fea21330569a68eb00845b8" ] && rm -rf $monlorpath/apps/verysync/bin/verysync
fi