$ErrorActionPreference = "Stop"

Set-Location "C:\Users\aravi\.gemini\antigravity\scratch\EVent-Management\k8s"

Write-Host "Deploying Event Management to Kubernetes..."

# Apply namespace first
kubectl apply -f 00-namespace.yaml

# Apply configurations and secrets
kubectl apply -f 01-configmap.yaml
kubectl apply -f 02-secrets.yaml

# Apply db init scripts configmap
kubectl apply -f 06-init-db-scripts.yaml

# Apply stateful services
Write-Host "Applying stateful services..."
kubectl apply -f 03-db-mysql.yaml
kubectl apply -f 04-db-postgres.yaml
kubectl apply -f 05-rabbitmq.yaml

# Wait a moment for DBs to initialize
Write-Host "Waiting 15 seconds for databases to start..."
Start-Sleep -Seconds 15

# Apply stateless microservices
Write-Host "Applying microservices..."
kubectl apply -f 10-user-service.yaml
kubectl apply -f 11-event-service.yaml
kubectl apply -f 12-booking-service.yaml
kubectl apply -f 13-payment-service.yaml
kubectl apply -f 14-notification-service.yaml
kubectl apply -f 15-ticket-generator.yaml

Write-Host "Deployment completed successfully! Check status with: kubectl get pods -n event-management"
