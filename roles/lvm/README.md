# role-lvm

This role sets up LVM volumes based on the environment variables assigned to the host

## usage example

Assuming you have a device `/dev/sdb` and you want to put it under a "storage" vg you could set the below vars for a host:

```
vgs:
  - vg: xardas
    pvs:
      - /dev/sdb
lvs:
  - vg: xardas
    lv: storage
    size: 100%FREE
    fstype: xfs

```
