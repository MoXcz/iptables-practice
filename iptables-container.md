# `iptabes` inside containers

A container is managed by Docker (when using Docker of course), which will make networking work differently from the host namespace and netfilter (which is framework used by `iptables` to define rules).

For the most part all rules defined inside the container are isolated inside the container (which is expected from a container), so for testing practices they work rather well.

> Note that it's only possible to use `iptables` when running the container as privileged (with the `--privileged` flag set).

Do be careful with rules defined outside the container, as they could filter and/or block how container traffic works (network traffic to the container passes to and from the host's network when forwarded, otherwise the `--network=host` option can be set to route the traffic to the host directly instead of forwarding it through the container namespace).

Docker *akshually* creates different rules under the `DOCKER` chain in the `NAT` table, which can be seen with:

```sh
sudo iptables -t nat -L -n # list the rules of NAT table
```

> For more info on what the command above does the `man` page says: *Please note that it (the command above) is often used with the `-n` option, in order to avoid long reverse DNS lookups. It is legal to specify the `-Z` (zero) option as well, in which case the chain(s) will be atomically listed and zeroed. The exact output is affected by the other arguments given. The exact rules are suppressed until you use `iptables -L -v`

> [!WARNING]
> Make your own research in this topic, consider this the ramblings of a student.

