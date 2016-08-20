#/bin/bash

sudo ovs-vsctl add-br br-tun

sudo ifconfig br-tun 192.168.155.2/24 up
