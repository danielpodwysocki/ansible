
## Roles overview

+ rocky8 - all common configurations and security improvements that can be standalone and don't rely on other roles for my Rocky Linux instances.  

+ consul - depending on whether the consul_server var is set, set up a consul server or a consul agent


# Requirments files
+ requirements.txt - necessary python modules
+ requirements.yaml - ansible galaxy dependencies

# Dynamic inventory

This repo makes use of ansible-hcloud-inventory. The code was forked into the ansible-hcloud-inventory directory of this repo, due to security concerns - should that repo get compromised at some point, your API key could be exposed. I reccomend you do the same for any ansible inventory scripts for public clouds.  

Original ansible-hcloud-inventory: https://github.com/hg8496/ansible-hcloud-inventory
