# role-fstab

This role creates appropriate fstab entries based on env variables

# Usage example

Assuming you have an XFS volume you want to mount under /dev/mapper/xardas-storage,
you can add the following variables to your host_vars:

```
fstab_mounts:
  - target: /storage
    device: /dev/mapper/xardas-storage
    fstype: xfs
```

