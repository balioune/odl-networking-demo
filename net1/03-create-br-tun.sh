#/bin/bash

sudo ovs-vsctl add-br br-tun

sudo ifconfig br-tun 192.168.50.1/24 up
