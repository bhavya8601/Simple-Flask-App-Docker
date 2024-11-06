# Variables
APP_NAME = simple-flask-app
PORT = 5070
NODE_PORT = 30007

# Docker build and push
docker-build:
	docker build -t $(APP_NAME) .

docker-run:
	docker run -p $(PORT):5070 $(APP_NAME)

# Kubernetes Deployment
k8s-deploy:
	kubectl apply -f deployment.yaml
	kubectl apply -f service.yaml

# Kubernetes Cleanup
k8s-clean:
	kubectl delete -f deployment.yaml
	kubectl delete -f service.yaml

# Access the app URL
k8s-url:
	@echo "Access the application at: http://<node-ip>:$(NODE_PORT)"

# Full setup and run in Docker
docker-setup-run: docker-build docker-run

# Help
help:
	@echo "Usage:"
	@echo "  make docker-build      Build the Docker image"
	@echo "  make docker-run        Run the Docker container on port 5070"
	@echo "  make k8s-deploy        Deploy the app to Kubernetes"
	@echo "  make k8s-clean         Remove the app from Kubernetes"
	@echo "  make k8s-url           Display the URL to access the app via NodePort"
	@echo "  make docker-setup-run  Build and run the app in Docker"
