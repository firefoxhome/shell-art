# Debian system(raspberry Pi)
	Setting dhcp to static, default dhcp

## Modify file: /etc/dhcpcd.conf
	Add unber tow lines, eg. ip address: 192.168.1.100

	interface eth0
	static ip_address=192.168.1.100

## restart networking
	sudo /etc/init.d/networking restart

## restart eth0
	sudo ifconfig eth0 down
	sudo ifconfig eth0 up
