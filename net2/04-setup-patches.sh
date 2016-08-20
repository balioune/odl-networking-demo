#/bin/bash

# Patch br-tu
sudo ovs-vsctl add-port br-tun patch-to-brint
sudo ovs-vsctl set interface patch-to-brint type=patch
sudo ovs-vsctl set interface patch-to-brint options:peer=patch-to-brtun

# Patch br1
sudo ovs-vsctl add-port br-int patch-to-brtun
sudo ovs-vsctl set interface patch-to-brtun type=patch
sudo ovs-vsctl set interface patch-to-brtun options:peer=patch-to-brint

