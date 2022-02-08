#!/usr/bin/env bash

SANAME="$1"
NAMESPACE="$2"
CHARTS_DIR=$(cd $(dirname $0)/../charts; pwd -P)

if [[ "$3" == "destroy" ]]; then
    echo "removing chart extension..."
    # remove the the operator and chart extensions
    kubectl delete Deployment t8c-operator -n ${NAMESPACE}
    kubectl delete CustomResourceDefinition xls.charts.helm.k8s.io
else 
    # deploy the chart extensions needed
    kubectl create -f "${CHARTS_DIR}/charts.helm.k8s.io_xls.yaml"

    # create the yaml for operator deployment and deploy it

cat > "${CHARTS_DIR}/operator.yaml" << EOL
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  labels:
    operators.coreos.com/t8c-certified.turbonomic: ""
  name: t8c-certified
  namespace: ${NAMESP}
spec:
  name: t8c-certified
  source: certified-operators
  sourceNamespace: openshift-marketplace
EOL
    kubectl create -f "${CHARTS_DIR}/operator.yaml" -n ${NAMESPACE}
fi

