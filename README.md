# docker-mininet-macos

> Dockerized mininet for macOS

## Why?

- macOS cannot install mininet, so we cannot use mininet with ONOS on macOS unless using VM.

## Environment

- macOS 10.12.6
- Docker version 18.06.0-ce

## Usage

```bash
# Build DockerFile
docker build -t mininet-macos:lastest .

# run options
-i, –interactive, Keep STDIN open even if not attached
-t, –tty, Allocate a pseudo-TTY
--rm, Automatically remove the container when it exits
--network=host: for connecting to host and host ip
--privileged, mininet need root

# Create container and open bash
docker run -it --network=host --privileged --rm mininet-macos:lastest
# Create container in background and open bash
docker run -it --network=host --privileged -d mininet-macos:lastest
docker exec -it <CONTAINER_ID> bash

# Get Host IP
host docker.for.mac.localhost

# mininet
mn --test pingall
mn --topo=tree,depth=2 --controller=remote,ip=<HOST_IP>,port=6653
# My machine
mn --topo=tree,depth=2 --controller=remote,ip=192.168.65.2,port=6653
```

## Notes

- https://docs.docker.com/docker-for-mac/networking/
    - There is no docker0 bridge on macOS.
    - Host cannot ping containers.
- https://stackoverflow.com/questions/41886752/how-to-get-mac-host-ip-address-from-a-docker-container
    - docker.for.mac.localhost which will resolve to the internal IP address used by the host.

```bash
# apt install
curl: curl
dnsutils: nslookup, host, dig
iproute2: ip
iputils-ping: ping
mininet: mn
openvswitch-switch: ovs-vsctl, service openvswitch-switch

# A little big directory
rm -rf /var/lib/apt/lists/

# https://davidwalsh.name/docker-remove-all-images-containers
# Delete every Docker containers
# Must be run first because images are attached to containers
docker rm -f $(docker ps -a -q)
# Delete every Docker image
docker rmi -f $(docker images -q)
```
