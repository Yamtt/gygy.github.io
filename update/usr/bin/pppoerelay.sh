#!/bin/sh

. /lib/functions.sh

relay_get(){
	config_get enabled $1 enabled
	[ $enabled -gt 0 ] || return 1
	config_get s_if_name $1 s_if_name
	config_get c_if_name $1 c_if_name
	config_get two_way_relay $1 two_way_relay
	if [ "$two_way_relay" == "1" ];then
	  OPTIONS=" -B $s_if_name -B $c_if_name"
	else
	  OPTIONS=" -S $s_if_name -C $c_if_name"
	fi
	/usr/sbin/pppoe-relay $OPTIONS $args
	echo /usr/sbin/pppoe-relay $OPTIONS $args

}



stop() {
killall -9 pppoe-relay
#	ps -a|grep pppoe-relay|while read line
#	do
#	  killall pppoe-relay>/dev/null 2>&1
#	done
}

case "$1" in
	"start")
	echo start
	config_load pppoe-relay
	timeout=`uci get pppoe-relay.@config[0].timeout -q`
	max_n_sessions=`uci get pppoe-relay.@config[0].max_n_sessions -q`
	[ -n "$timeout" ] && args=" -i $timeout"
	[ -n "$max_n_sessions" ] && args=" $args -n $max_n_sessions"
	config_foreach relay_get relay
	echo end
	exit 0	
;;
	"stop")echo stop; killall -9 pppoe-relay;;
esac
