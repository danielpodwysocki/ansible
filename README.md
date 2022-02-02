
## Roles overview

+ rocky8 - all common configurations and security improvements that can be standalone and don't rely on other roles for my Rocky Linux instances.  
+ consul - depending on whether the consul_server var is set, set up a consul server or a consul agent


## Roles that won't see any attention anymore: 

+ nomad - sets up Nomad nodes and joins them together using Consul - will not get any new updates, went with Kubernetes instead


## Requirments files
+ requirements.txt - necessary python modules - to install run `pip3 install -r requirements.txt`
+ requirements.yaml - ansible galaxy dependencies - to install them, run `ansible-galaxy install -r requirements.yaml`

# Dynamic inventory

This repo makes use of ansible-hcloud-inventory. The code was forked into the ansible-hcloud-inventory directory of this repo, due to security concerns - should that repo get compromised at some point, your API key could be exposed. I reccomend you do the same for any ansible inventory scripts for public clouds.  

Original ansible-hcloud-inventory: https://github.com/hg8496/ansible-hcloud-inventory

## How to make use of it

In order to use the dynamic inventory, you need to set the HCLOUD_TOKEN to a Hetzner Cloud API key - it's highly reccomended you set its permissions to "read only" for this.

Example playbook execution:
```
export HCLOUD_TOKEN=<your_token>
ansible-playbook playbooks/common.yaml
```

## Label scheme

Due to how ansible-hcloud-inventory processes labels, we need to use the below KEY: VALUE format:
```
[role name]: "group"
```

An example would be `consul-servers: "group"`
The reason for this is to allow us to target multiple groups - if `group` was the key and not the value, we wouldn't be able to have a host in 2 inventory groups as easily.

# direnv

For development purposes, you might want to load your HCLOUD_TOKEN dynamically.

This can be done safely via `direvn` - it will allow you to create a file with the environment variables and have it load whenever you're in the project repo - you can simply chmod it to `500` to make sure nobody has access to it.

`direnv` setup docs can be found here: https://github.com/direnv/direnv

It's been added to .gitignore to ensure it never gets commited. You can find an example .envrc file in `.envrc.example`.

To allow it to be loaded, you need to trust the directory. After you create you the .envrc and populate it, run the below:

```
direnv allow .
```

It's recommended to encrypt this file at rest when you're not working on the repo.

## Encrypting variables

```
ansible-vault encrypt_string
```

## Deployment

```
# oracle-prod
ansible-playbook --ask-vault-pass  -i playbooks/deploy/oracle/inventory.oci.yaml playbooks/deploy/oracle/oracle-prod.yaml

# hetzner-prod
ansible-playbook playbooks/deploy/hetzner-prod.yaml

```
