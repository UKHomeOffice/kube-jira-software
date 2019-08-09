# Jira Deployment on Kubernetes

Deployment of Jira onto the UK HomeOffice ACP Kubernetes platform using the docker-jira-software Docker image.

The [`postres`](./postgres) folder contains Kubernetes resources to deploy a Postrgres database if running the Jira database is preferred compared to using a cloud provider service such as RDS.
