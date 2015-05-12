# chef-provisioning-node

## Delivery Cluster Provisioning Node

### Getting Started

#### In the chef-provisioning-node cookbook

1. kitchen converge provision-centos-66
2. kitchen create delivery.*cent

#### On the provisioning node

3. Add /home/vagrant/.ssh/github_key.pub to github
4. Install delivery.license at /home/vagrant/delivery.license
5. CHEF_ENV=test chef exec rake setup:cluster
