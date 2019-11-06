#!/bin/bash

source libs.sh

# Retrieve the eks cluster name
cluster_name=$(echo $1 | jq -r '.ResourceProperties.cluster_name | select(type == "string")')
if [ -n "${cluster_name}" ];then
    echo "Updating kubeconfig - cluster_name=$cluster_name"
    update_kubeconfig "$cluster_name" || exit 1
    echo "cluster_name=${cluster_name}" > /tmp/.env.config
else
    echo "Unable to find 'cluster_name' key!"
fi

# Retrieve the iam role arn
iam_role_arn=$(echo $1 | jq -r '.ResourceProperties.iam_role_arn | select(type == "string")')
if [ -n "${iam_role_arn}" ]; then
    configMap=$(get_config_map $iam_role_arn)

    echo "$configMap"
    get_contex
    echo "$configMap" | kubectl apply -f - 2>&1
    get_all
else
    echo "Unable to find 'iam_role_arn' key!"
fi
