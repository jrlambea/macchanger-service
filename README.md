# ATENCIÓN
Si buscas una manera de asegurarte el spoofing de una MAC Address que sepas que esta NO es la manera correcta, revisate la documentación sobre udev y trabaja sobre ello. Este script puede servir más como plantilla de servicio que de su propio propósito.

# Servicio para MAC Changer
## ¿De qué se trata?

Es un script que permite realizar spoofing de MAC Address en el arranque de la máquina, actúa como un servicio por lo que, cómo todo servicio de vecino, atiende a las acciones `start`y `stop`.

## Funcionamiento
Para cambiar todas las MAC Address de la máquina:
<pre><code>root@kali:~# service macchanger_service.sh start
Cambiando MAC Address de eth0...OK.
Cambiando MAC Address de wlan0...OK.</code></pre>

Para dejar las MAC Address por defecto:
<pre><code>root@kali:~# service macchanger_service.sh stop
Cambiando MAC Address de eth0 a valor de fábrica...OK.
Cambiando MAC Address de wlan0 a valor de fábrica...OK.</code></pre>

## Configuración de servicio

1. Descargar una copia del script y guardarlo en `/etc/init.d`.
2. Configurar el sevricio con `chkconfig macchanger_service.sh 2345`
3. Validar la configuración con `chkconfig --list macchanger_service.sh`
4. Reiniciar y comprobar los resultados.