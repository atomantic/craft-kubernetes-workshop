kubectl create -f pods/monolith.yaml
kubectl create -f pods/healthy-monolith.yaml
kubectl create secret generic tls-certs --from-file=tls/
kubectl create configmap nginx-proxy-conf --from-file=nginx/proxy.conf
kubectl create -f pods/secure-monolith.yaml
kubectl create -f services/monolith.yaml
gcloud compute firewall-rules create allow-monolith-nodeport \
  --allow=tcp:31000
kubectl label pods secure-monolith 'secure=enabled'
kubectl create -f deployments/auth.yaml
kubectl create -f services/auth.yaml
kubectl create -f deployments/hello.yaml
kubectl create -f services/hello.yaml
kubectl create configmap nginx-frontend-conf --from-file=nginx/frontend.conf
kubectl create -f deployments/frontend.yaml
kubectl create -f services/frontend.yaml
