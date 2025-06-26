# `iptables`

Some options to have in mind while using `iptables`:

- `-j`. Define the policy: ACCEPT, DROP
- `-s`. Define the source: ip, domain, etc.
- `-I`. Insert at the top
- `-A`. Append at the bottom
- `-D`. Delete a specific rule number

And now with the explanation. One of the most important options to have in mind when setting rules is `iptables -t <table> -L` to print all the rules of a specific *table* (detailed definition and list of tables can be found [here](./iptables-tables.md))

> # The output of these commands may change drastically when there's some other interface installed (UFW, firewalld, etc.)

```sh
iptables -L                # print all rules of default table (filter table)
iptables -t <table> -L     # specify a table
iptables -L --line-numbers # add a number column

iptables -I INPUT -s <ip> -j DROP    # insert a DROP policy to a specific IP
iptables -I INPUT -s <ip>/24 -j DROP # insert a DROP policy to a subnet

iptables -D INPUT 1 # delete first INPUT rule
```

> TODO...

