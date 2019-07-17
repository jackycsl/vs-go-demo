# Hello World Kubernetes Useful Command

docker build -t vsgdev/go-demo:0.1 .
docker run --rm -p 4000:4000 vsgdev/go-demo:0.1
docker push vsgdev/go-demo:0.1

kubectl apply -f go-demo-deployment.yaml
kubectl expose deployment go-demo-deployment --type=LoadBalancer --port=4000
minikube service go-demo-deployment

while true; do curl http://192.168.99.100:30344/ping; printf "\n"; sleep 1; done
