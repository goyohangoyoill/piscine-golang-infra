#!/bin/bash
PV="./db/mariadb-pv.yml"
DB="./db/mariadb-deploy.yml"
GRADE="grade/grade-deploy.yml"
INTERACT="interact/interact-deploy.yml"

kubectl delete -f ${DB}
kubectl delete -f ${PV}
kubectl delete -f ${GRADE}
kubectl delete -f ${INTERACT}
kubectl delete secret mysql-password