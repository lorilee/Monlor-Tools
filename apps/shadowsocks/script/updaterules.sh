#!/bin/ash
#copyright by monlor
monlorpath=$(uci -q get monlor.tools.path)
[ $? -eq 0 ] && source "$monlorpath"/scripts/base.sh || exit
appname=shadowsocks
service=ShadowSocks
chnroute=$monlorpath/apps/$appname/config/chnroute.conf
gfwlist=$monlorpath/apps/$appname/config/gfwlist.conf

logsh "【$service】" "更新$appname分流规则"
result1=$(curl -skL -w %{http_code} -o /tmp/gfwlist.conf https://cokebar.github.io/gfwlist2dnsmasq/gfwlist_domain.txt)
[ "$result1" == "200" ] && cp -rf /tmp/gfwlist.conf $gfwlist 
rm -rf /tmp/gfwlist.conf
result2=$(curl -skL -w %{http_code} -o /tmp/chnroute.txt https://koolshare.ngrok.wang/maintain_files/chnroute.txt)
[ "$result2" == "200" ] && cp -rf /tmp/chnroute.txt $chnroute
rm -rf /tmp/chnroute.txt