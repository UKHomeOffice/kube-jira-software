#!/usr/bin/env bash
#
#  vim:ts=2:sw=2:et
#
# use Docker Hub by default
# USE_DOCKER_CACHE_ONLY set to "true" is useful when debugging cached Docker images
export USE_DOCKER_CACHE_ONLY="false"
export JIRA_DATA_VOLUME_SIZE="10Gi"
export POSTGRES_JIRA_DATA_VOLUME_SIZE="10Gi"
export JIRA_CPU_LIMIT="1000m"
export JIRA_CPU_REQUEST="200m"
export JIRA_DOCKER_IMAGE="quay.io/ukhomeofficedigital/jira-software"
export JIRA_DOCKER_GIT_REPO="https://github.com/UKHomeOffice/docker-jira-software/"
export JIRA_DOCKER_GIT_REPO_OWNER="devops@digital.homeoffice.gov.uk"
export JIRA_VERSION="8.1.2"
# Memory request and limit should be in megabytes wit no unit suffix (used as a kube param and a JVM param)
export JIRA_MEMORY_LIMIT="3072"
export JIRA_MEMORY_REQUEST="3072"
# export KUBE_NGINX_CPU_LIMIT="500m"
# export KUBE_NGINX_CPU_REQUEST="100m"
# export KUBE_NGINX_MEMORY_LIMIT="256Mi"
# export KUBE_NGINX_MEMORY_REQUEST="20Mi"
# export NGINX_VERSION="v3.2.9"
export NODE_SELECTOR=""
export STORAGE_CLASS="gp2-encrypted"
export JIRA_ATL_DB_DRIVER="org.postgresql.Driver"
export JIRA_ATL_DB_TYPE="postgres72"
export JIRA_JDBC_URL_DRIVER="postgresql"

# Also need to define the following for your environment
# JIRA_DNS_NAME
# KUBE_NAMESPACE
# JIRA_DB_SECRET: name of k8s secret containing the following keys:
#   port
#   resource_id
#   username
#   default_db
#   endpoint
#   password
# JIRA_DNS_NAME