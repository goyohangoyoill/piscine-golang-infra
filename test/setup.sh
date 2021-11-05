#!/bin/bash
PWFILE="./db/password.txt"
DB="./db/mariadb-deploy.yml"
PV="./db/mariadb-pv.yml"
GRADE="./grade/grade-deploy.yml"
INTERACT="./interact/interact-deploy.yml"

if [[ -e ${PWFILE} ]] ; then
	kubectl create secret generic mysql-password --from-file=${PWFILE}
else
	echo "패스워드 파일을 추가해주세요"
fi

kubectl apply -f ${PV}
kubectl apply -f ${DB}
kubectl apply -f ${GRADE}
kubectl apply -f ${INTERACT}
