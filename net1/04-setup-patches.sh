#/bin/bash

# Patch br-tu
sudo ovs-vsctl add-port br-tun patch-to-br1
sudo ovs-vsctl set interface patch-to-br1 type=patch
sudo ovs-vsctl set interface patch-to-br1 options:peer=patch-to-brtun

# Patch br1
sudo ovs-vsctl add-port br1 patch-to-brtun
sudo ovs-vsctl set interface patch-to-brtun type=patch
sudo ovs-vsctl set interface patch-to-brtun options:peer=patch-to-br1

