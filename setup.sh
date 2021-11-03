export NAME =
export KEY =
export VAL =
kubectl create -f persistent-volume.yaml
kubectl create -f maria-claim.yaml
kubectl create secret generic $(NAME) --from-literal=$(KEY)='$(VAL)'
kubectl create -f maria-deploy.yaml
kubectl create -f maria-service.yaml
kubectl create -f grade-deploy.yaml
kubectl craete -f grade-service.yaml
kubectl create -f interact-deploy.yaml
kubectl create -f interact-load-balancer.yaml

