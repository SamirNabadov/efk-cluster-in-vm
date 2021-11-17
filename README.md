EFK CLuster
================================


Install & Configure EFK (Elasticsearch Fluentd Kibana)


Configured software and tools
------------
* Elasticsearch 7.15.1
* Kibana 7.13.1
* Fluentd (KFO) v1.16.1


Infrastructur INFO
------------
* 2 client node and kibana (Configured on the 2nd client node)
* 3 master node
* 4 data node
* Minimum requirements of nodes: CPU 4 / RAM 16
* requests routed to kibana(UI searching logs) and client node(for writing-fluentd) with dns based load balancing


Basic settings
------------
* Installing and Configuring EFK cluster
* Configured KFO (Kubernetes-Fluentd-operator) in Kubernetes cluster
* Configured Fluentd configmap for prod namespace in Kubernetes cluster


Currently tested on these Operating Systems
* Linux/RHEL/CentOS 7


Requirements
------------
* Ansible 2.9.25


Dependencies
------------
* Kubernetes cluster access from one node server
* Kubectl and Helm modules must be configured on the node server
* Requires elevated root privileges
* Copy Ansible control machine user's public SSH key (usually called id_rsa.pub) into the remote machine working directory
* Add hosts address and names for VMs : inventory
* Prepare variable file based on your requirements: vars/vars.yaml


Running the Deployment
----------------------

On the Ansible Control Machine  

__To deploy__

`./scripts/deploy.sh`


Author Information
------------------

Samir Nabadov
