# iptables-practice

`iptables` is a firewall utility for managing network traffic using Netfilter modules to configure firewall rules and/or chains. This repository will contain (hopefully) some small examples of how `iptables` can be used to block/allow connections.

> Note that because this is done with a container there could be some differences to a bare-metal/VM environment, read more [iptables-container](./iptables-container.md)

To setup the container:

```sh
# clone repo
git clone https://github.com/MoXcz/iptables-practice
cd iptables-practice

docker build . -t iptables-practice
# for testing
docker run -d --rm --name nginx-iptables --privileged -p 8080:80 iptables-practice:latest
# for later use
docker run -d --name nginx-iptables --privileged -p 8080:80 iptables-practice:latest

# Then enter the container
docker exec -it nginx-iptables bash
```

Before doing anything else, test that it's possible to `GET` the expected `nginx` welcome page:

```sh
curl http://localhost:8080 # as defined in the port mapping above
```

Inside the container it's now possible to set different `iptables` rules. A clear example is setting the `INPUT` chain to `DROP`, which will not allow any incoming traffic, essentially blocking connections made to the `nginx` web server:
```sh
# should print default policies for the filter table, which ACCEPT everything
iptables -L
 # this DROPs all connections made to the container
iptables --policy INPUT DROP
# this will no longer return anything, it DROPped connection
curl http://localhost:8080
# should load the welcome page again
iptables --policy INPUT ACCEPT
```

[> Next](./iptables.md)
