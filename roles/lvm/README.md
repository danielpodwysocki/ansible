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
    size: 100%VG
    fstype: xfs

```

## pitfalls

When creating LVM by hand it's common to use %FREE to indicate size, for example `100%FREE`
This needs to be avoided, since this value will be different between applies, breaking idempotency -  if we use 100%, next run we will have 0 bytes free space.

