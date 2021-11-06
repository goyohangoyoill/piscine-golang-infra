# Piscine Golang Infra

> GKE

1. GKE 클러스터에 다음과 같은 방식으로 연결합니다.

``` shell
gcloud container clusters get-credentials ${CLUSTER-ID} --zone ${ZONE} --project ${PROJECT-ID}
```

2. DB 암호로 사용할 password.txt 파일을 생성 후 원하는 암호를 base64로 인코딩한 후 파일 에 저장합니다.


```
echo 42seoul | base64 > password.txt
```

3 setup.sh를 실행합니다.

```
./setup.sh
```
