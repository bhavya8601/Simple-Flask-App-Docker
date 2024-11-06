# Variables
APP_NAME = simple-flask-app
PORT = 5070
NODE_PORT = 30007

install:
        pip3 install -r requirements.txt
# Run the Flask app
run:
        python3 product_list_app.py
# Docker build and push
docker-build:
        docker build -t $(APP_NAME) .

docker-run:
        docker run -d -p $(PORT):5070 $(APP_NAME)

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
        @echo "  make install          Install Python dependencies"
        @echo "  make run              Run the Flask app"
        @echo "  make docker-build      Build the Docker image"
        @echo "  make docker-run        Run the Docker container on port 5070"
        @echo "  make k8s-deploy        Deploy the app to Kubernetes"
