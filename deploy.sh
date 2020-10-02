docker build -t coldperformer/multi-client -f ./client/Dockerfile ./client
docker build -t coldperformer/multi-server -f ./client/Dockerfile ./server
docker build -t coldperformer/multi-worker -f ./client/Dockerfile ./worker
docker push coldperformer/multi-client
docker push coldperformer/multi-server
docker push coldperformer/multi-worker
kubectl apply -f k8s