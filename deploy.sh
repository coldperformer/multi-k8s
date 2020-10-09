docker build -t coldperformer/multi-client:latest -t coldperformer/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t coldperformer/multi-server:latest -t coldperformer/multi-server:$SHA -f ./client/Dockerfile ./server
docker build -t coldperformer/multi-worker:latest -t coldperformer/multi-worker:$SHA -f ./client/Dockerfile ./worker

docker push coldperformer/multi-client:latest
docker push coldperformer/multi-server:latest
docker push coldperformer/multi-worker:latest

docker push coldperformer/multi-client:$SHA
docker push coldperformer/multi-server:$SHA
docker push coldperformer/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=coldperformer/multi-server:$SHA
kubectl set image deployments/client-deployment client=coldperformer/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=coldperformer/multi-worker:$SHA