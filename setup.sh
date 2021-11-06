#!/bin/bash
PWFILE="./db/password.txt"
MARIA_DB="./db/mariadb-deploy.yml"
MARIA_PV="./db/mariadb-pv.yml"
MONGO_DB="./db/mongodb-deploy.yml"
MONGO_PV="./db/mongodb-pv.yml"
GRADE="./grade/grade-deploy.yml"
INTERACT_DEPLOY="./interact/interact-deploy.yml"
INTERACT="./interact/interact.yml"

echo "Golang-Piscine 채점 & 매칭 서버 배포 시스템"
echo "1. 전체 배포"
echo "2. 특정 파일 재배포"
echo "3. 전체 배포 삭제"
echo -n "배포 유형을 선택해주세요(번호를 입력해주세요) : "
read

if [[ $REPLY -eq 1 ]] ; then
	echo "배포할 데이터베이스 종류를 선택해주세요."
	echo "1. Maria DB"
	echo "2. Mongo DB"
	echo -n "배포할 데이터베이스를 선택해주세요(번호를 입력해주세요) : "
	read

	if [[ $REPLY -eq 1 ]] ; then
		if [[ -e ${PWFILE} ]] ; then
			kubectl create secret generic mysql-password --from-file=${PWFILE}
		else
			echo "패스워드 파일을 추가해주세요"
			exit 1
		fi

		kubectl apply -f ${MARIA_DB}
		kubectl apply -f ${MARIA_PV}
		sleep 42
		kubectl apply -f ${GRADE}
		kubectl apply -f ${INTERACT}

	elif [[ $REPLY -eq 2 ]] ; then
			if [[ -e ${PWFILE} ]] ; then
			kubectl create secret generic mongo-password --from-file=${PWFILE}
		else
			echo "패스워드 파일을 추가해주세요"
			exit 1
		fi
		kubectl apply -f ${MONGO_DB}
		kubectl apply -f ${MONGO_PV}
		sleep 42
		kubectl apply -f ${GRADE}
		kubectl apply -f ${INTERACT}
	else
		echo "INPUT ERROR : INPUT VALUE ($REPLY)"
	fi
elif [[ $REPLY -eq 2 ]] ; then
	echo "재배포할 서버를 선택해주세요."
	echo "1. Interact"
	echo "2. Grade"
	echo "3. MariaDB"
	echo "4. MongoDB"
	echo -n "재배포할 서버를 선택해주세요(번호를 입력해주세요) : "
	read
	
	if [[ $REPLY -eq 1 ]] ; then
		echo "Interact를 선택하셨습니다."
		echo "1. Interact Deploy"
		echo "2. Interact Deploy + Service"
		echo -n "재배포 선택 : "
		read
		if [[ $REPLY -eq 1 ]] ; then
			kubectl delete -f {$INTERACT_DEPLOY}
			kubectl apply -f {$INTERACT_DEPLOY}
		elif [[ $REPLY -eq 2 ]] ; then
			kubectl delete -f {$INTERACT}
			kubectl apply -f {INTERACT}
		else
			echo "INPUT ERROR : INPUT VALUE ($REPLY)"
		fi
	else
		echo "개발중.."
	fi
elif [[ $REPLY -eq 3 ]] ; then
	echo "배포 삭제할 데이터베이스 종류를 선택해주세요."
	echo "1. Maria DB"
	echo "2. Mongo DB"
	echo -n "배포 삭제할 데이터베이스를 선택해주세요(번호를 입력해주세요) : "
	read

	if [[ $REPLY -eq 1 ]] ; then
		kubectl delete secret mysql-password
		kubectl delete -f ${MARIA_DB}
		kubectl delete -f ${MARIA_PV}
		kubectl delete -f ${GRADE}
		kubectl delete -f ${INTERACT}

	elif [[ $REPLY -eq 2 ]] ; then
		kubectl delete secret mongo-password 
		kubectl delete -f ${MONGO_DB}
		kubectl delete -f ${MONGO_PV}
		kubectl delete -f ${GRADE}
		kubectl delete -f ${INTERACT}
	else
		echo "INPUT ERROR : INPUT VALUE ($REPLY)"
	fi
else
	echo "INPUT ERROR : INPUT VALUE ($REPLY)"
fi