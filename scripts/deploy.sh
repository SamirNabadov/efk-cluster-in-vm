#!/bin/bash

#Assignment of variables
project_dir=$(pwd)
SECONDS=0

#Installation Galaxy roles
function install_galaxy_role() {
    ansible-galaxy install elastic.elasticsearch,v7.15.1
    if [ $? -eq 0 ];
    then
        echo "Elasticsearch role installation was successful!"
        echo "---------------------------------"
    else
        echo "Installation failed!"
        exit 1
    fi
}

#Installation Elasticsearch
function deploy_elasticsearch() {
    ansible-playbook $project_dir/elastic.yaml -i inventory
    if [ $? -eq 0 ];
    then
        echo "Elasticsearch installation was successful!"
        echo "---------------------------------"
    else
        echo "Installation failed!"
        exit 1
    fi
}

#Installation Kibana
function deploy_kibana() {
    ansible-playbook $project_dir/kibana.yaml -i inventory
    if [ $? -eq 0 ];
    then
        echo "Kibana installation was successful!"
        echo "---------------------------------"
    else
        echo "Installation failed!"
        exit 1
    fi
}

#Installation Fluend (KFO)
function deploy_fluentd() {
    ansible-playbook $project_dir/fluentd.yaml -i inventory
    if [ $? -eq 0 ];
    then
        echo "Fluend installation was successful!"
        echo "---------------------------------"
    else
        echo "Installation failed!"
        exit 1
    fi
}


function main() {
    install_galaxy_role
    deploy_elasticsearch
    deploy_kibana
    deploy_fluentd
    echo "---------------------------------"
    echo "Time spent deploying EFK Cluster: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
}

main
