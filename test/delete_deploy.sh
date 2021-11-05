#!/bin/bash
PWFILE="./db/password.txt"
DB="./db/maridb-deploy.yml"
PV="./db/mariadb-pv.yml"
GRADE="grade-deploy.yml"
INTERACT="interact-deploy.yml"

kubectl delete -f ${PV}
kubectl delete -f ${DB}
kubectl delete -f ${GRADE}
kubectl delete -f ${INTERACT}
kubectl delete secret mysql-password