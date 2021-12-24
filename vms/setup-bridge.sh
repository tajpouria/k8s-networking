
NS1="NS1"
NS2="NS2"

IP1="172.16.0.2"
IP2="172.16.0.3"

ip netns add $NS1
ip netns add $NS2
ip netns show

ip link add veth10 type veth peer name veth11
ip link add veth20 type veth peer name veth21
ip link show type veth

ip link set veth11 netns $NS1
ip link set veth21 netns $NS2

ip netns exec $NS1 ip addr add $IP1/24 dev veth11
ip netns exec $NS2 ip addr add $IP2/24 dev veth21
