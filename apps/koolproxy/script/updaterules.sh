#!/bin/ash
#copyright by monlor
monlorpath=$(uci -q get monlor.tools.path)
[ $? -eq 0 ] && source "$monlorpath"/scripts/base.sh || exit
service=KoolProxy
appname=koolproxy

logsh "【$service】" "更新用户自定义规则"
result=$(curl -skL -w %{http_code} -o /tmp/user.txt https://raw.githubusercontent.com/kysdm/ad-rules/master/user-rules-koolproxy.txt)
[ "$result" == "200" ] && cp -rf /tmp/user.txt $monlorpath/apps/$appname/bin/data/rules/user.txt