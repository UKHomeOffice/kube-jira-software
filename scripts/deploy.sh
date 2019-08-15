#!/usr/bin/env bash
#
#  vim:ts=2:sw=2:et
#
echo "--- kube api url: ${KUBE_SERVER}"
echo "--- namespace: ${KUBE_NAMESPACE}"

kd_options="--insecure-skip-tls-verify --namespace=${KUBE_NAMESPACE} --check-interval=15s --debug-templates"

if [[ -n "${CONTAINERISED_DATABASE}" ]]; then
  echo "[info] running Postgres on Kubernetes"
  if ! kd ${kd_options} \
    -f kube/postgres/statefulset.yml \
    -f kube/postgres/service.yml \
    -f kube/postgres/network-policy.yml \
  ; then
    echo "[failed] failed to deploy Postgres as a k8s service"
    exit 1
  fi
fi

kd ${kd_options} \
  -f kube/statefulset.yml \
  -f kube/ingress.yml \
  -f kube/network-policy.yml \
  -f kube/service.yml \

exit $?
