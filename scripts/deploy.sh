#!/usr/bin/env bash
#
#  vim:ts=2:sw=2:et
#
echo "--- kube api url: ${KUBE_SERVER}"
echo "--- namespace: ${KUBE_NAMESPACE}"

kd_options="--insecure-skip-tls-verify --namespace=${KUBE_NAMESPACE} --check-interval=15s --debug-templates"

if [[ -n "${CONTAINERISED_DATABASE}" ]]; then
  echo "[info] running Postgres in a pod"
  if ! kd ${kd_options} \
    -f kube/postgres/deployment.yml \
    -f kube/postgres/service.yml \
    -f kube/postgres/network-policy.yml \
  ; then
    echo "[failed] failed to deploy Postgres as a k8s service"
    exit 1
  fi
fi

if [[ -n "${JIRA_DATA_VOLUME_SIZE}" ]]; then
  echo "[info] managing persistent volume claim for jira storage of ${JIRA_DATA_VOLUME_SIZE}"
  if ! kd ${kd_options} -f kube/pvc.yml; then
    echo "[failed] unable create provision volume"
    exit 1
  fi
fi

kd ${kd_options} \
  -f kube/deployment.yml \
  -f kube/ingress.yml \
  -f kube/network-policy.yml \
  -f kube/service.yml \

exit $?
