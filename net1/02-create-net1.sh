#/bin/bash

sudo ovs-vsctl add-br br1
sudo ovs-vsctl set-controller br1 tcp:192.168.56.20:6653
sudo ovs-vsctl set-manager tcp:192.168.56.20:6640

### VM1
sudo ip link add vm1-eth0 type veth peer name vm1-br
sudo ip link set dev vm1-eth0 address f6:00:00:ff:01:01
sudo ip link set dev vm1-br address f6:00:00:0f:11:01

sudo ip link set dev vm1-eth0 up
sudo ip link set dev vm1-br up

sudo ip netns add vm1
sudo ip link set vm1-eth0 netns vm1
sudo ip netns exec vm1 ip addr add dev vm1-eth0  192.168.1.1/24
sudo ip netns exec vm1 ip link set dev lo up
sudo ip netns exec vm1 ip link set dev vm1-eth0 up

sudo ip netns exec vm1 ip route add default dev vm1-eth0

sudo ovs-vsctl add-port br1 vm1-br

### VM2
sudo ip link add vm2-eth0 type veth peer name vm2-br
sudo ip link set dev vm2-eth0 address f6:00:00:ff:01:15
sudo ip link set dev vm2-br address f6:00:00:0f:11:55

sudo ip link set dev vm2-eth0 up
sudo ip link set dev vm2-br up

sudo ip netns add vm2
sudo ip link set vm2-eth0 netns vm2
sudo ip netns exec vm2 ip addr add dev vm2-eth0  192.168.1.2/24
sudo ip netns exec vm2 ip link set dev lo up
sudo ip netns exec vm2 ip link set dev vm2-eth0 up

sudo ip netns exec vm2 ip route add default dev vm2-eth0

sudo ovs-vsctl add-port br1 vm2-br

sleep 5
sudo ip netns exec vm1 ping -c4 192.168.1.2
