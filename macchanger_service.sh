#!/bin/bash

### BEGIN INIT INFO
# Provides:        macchanger
# Required-Start:  $network
# Required-Stop:   
# Default-Start:   2 3 4 5
# Default-Stop: 
# Short-Description: Changes the network adapters MAC Address
### END INIT INFO

sleep 1

##################################################################################
#
#	Script para randomizar las macaddress de los dispositivos de red al inicio
#	del sistema operativo.
#
##################################################################################

ARG="$1"

case $ARG in
	"start")
		
		ADAPTERS="$(ifconfig | grep "^[a-z].*" | egrep -v "^lo |^vmn"| cut -d" " -f1)"

		for adapter in $ADAPTERS
		do
			echo -n "Cambiando MAC Address de ${adapter}..."
			
			ifconfig $adapter down &> /dev/null
			macchanger -r $adapter &> /dev/null
			
			if (( $? )); then
				echo "No se ha podido cambiar correctamente."
			else
				ifconfig $adapter up &> /dev/null
				echo "OK."
			fi
			
		done
		;;

	"stop")
		
		ADAPTERS="$(ifconfig | grep "^[a-z].*" | egrep -v "^lo |^vmn"| cut -d" " -f1)"

		for adapter in $ADAPTERS
		do
			echo -n "Cambiando MAC Address de ${adapter} a valor de fábrica..."
			
			ifconfig $adapter down &> /dev/null
			macchanger -p $adapter &> /dev/null
			
			if (( $? )); then
				echo "No se ha podido cambiar correctamente."
			else
				ifconfig $adapter up &> /dev/null
				echo "OK."
			fi

		done
		;;

	* )
		echo "Uso: $0 [ stop | start ]"
		exit 5
		;;
esac
