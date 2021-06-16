```
nova list --all-tenants
```

```

```

```

possibly as a result of the power blip, VM 172.16.112.125 is kernel panicking on boot (at least according to the noVNC window to that VM – I’ve attached what I can see).

Is it possible to recover the instance? I have tried a “soft” and “hard” reboot via the openstack interface?

**➜ ****~** nova list --all-tenants | grep "172.16.112.125"

| a4bb3f2b-e13d-4929-b23e-9bd7a0e0f2e5 | jenky gocdb eosc hub view vm | 820e06700d214588b860eb0cd45b393a | ACTIVE | - | Running | Internal=**172.16.112.125** |

```