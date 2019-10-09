#!/bin/bash

set +e
set -x

echo "$INTERNAL_CA_CERT" >>/etc/ssl/certs/ca-certificates.crt
/var/vcap/packages/cloud_controller_ng/cloud_controller_ng/bin/cloud_controller -c "/var/vcap/jobs/cloud_controller_ng/config/cloud_controller_ng.yml"
