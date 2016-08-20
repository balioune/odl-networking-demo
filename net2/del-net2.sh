#/bin/bash

sudo ip netns del vm1
sudo ip netns del vm2

sudo ovs-vsctl del-br br-int
sudo ovs-vsctl del-br br-tun
