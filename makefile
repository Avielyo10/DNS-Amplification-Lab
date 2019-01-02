attacker:
	docker build --rm -t avielyosef/ubuntu-dns-amplification:attacker -f Dockerfile.attacker .
	docker run --rm -ti --net myLab --name Attacker avielyosef/ubuntu-dns-amplification:attacker
sniff: 
	docker build --rm -t avielyosef/ubuntu-dns-amplification:sniff -f Dockerfile.sniff .
	docker run --rm -ti --net myLab --name Sniff avielyosef/ubuntu-dns-amplification:sniff
dns1:
	docker run --rm -d --net myLab --name DNS1 --cap-add=NET_ADMIN andyshinn/dnsmasq
dns2:
	docker run --rm -d --net myLab --name DNS2 --cap-add=NET_ADMIN andyshinn/dnsmasq
dns3:
	docker run --rm -d --net myLab --name DNS3 --cap-add=NET_ADMIN andyshinn/dnsmasq
	

allDNS: dns1 dns2 dns3

stopAll: 
	docker container stop DNS1 DNS2 DNS3
