# Application Organizing Order

1. Cluster of Kubernetes should be created base on ``docker``, not ``containerd``. To launch cluster on the local terminal, use ``cloud sdk`` with following command.
> gcloud container clsuters get-credentials $(CLUSTER) --zone (ZONE) --proejct $(PROJECT)

2. Login Docker on the cluster.
> docker login

3. Create credential for Docker Hub.
> kubectl create secret docker-registry $(NAME) --docker-username=$(USERNAME) --docker-password=$(PASSWORD) --docker-email=$(EMAIL)

4. Create PV with ``persistent-volume.yaml``.
> kubectl create -f persistent-volume.yaml

5. Create Claim with ``maria-claim.yaml``.
> kubectl create -f maria-claim.yaml

6. Create credential for ``maria-deploy.yaml``.
> kubectl create secret generic $(NAME) --from-literal=$(KEY)='$(VAL)'

7. Create Deployment with ``maria-deploy.yaml``.
> kubectl  create -f maria-deploy.yaml

8. Create Service with ``maria-service.yaml``.
> kubectl create -f maria-service.yaml

9. Create Deployment with ``grade-deploy.yaml``.
> kubectl create -f grade-deploy.yaml

10. Create Service with ``grade-service.yaml``.
> kubectl craete -f grade-service.yaml

11. Create Deployment with ``interact-deploy.yaml``.
> kubectl create -f interact-deploy.yaml

12. Create LB to match exposed Nodeport with ``interact-load-balancer.yaml``.
> kubectl create -f interact-load-balancer.yaml
