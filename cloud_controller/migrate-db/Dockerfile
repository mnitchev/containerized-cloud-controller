FROM eirini/cloud_controller

COPY migrate-db.sh .

ENTRYPOINT [ "/var/vcap/packages/cloud_controller_ng/cloud_controller_ng/migrate-db.sh" ]
