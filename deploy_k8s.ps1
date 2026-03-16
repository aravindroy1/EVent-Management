$ErrorActionPreference = "Stop"

Set-Location "C:\Users\aravi\.gemini\antigravity\scratch\EVent-Management"

Write-Host "Deploying Event Management to Kubernetes..."

# Apply the unified manifest
kubectl apply -f deployment.yml

Write-Host "Deployment completed successfully! Check status with: kubectl get pods -n event-management"
Write-Host "Once pods are running, access the web dashboard at http://<Worker-Node-IP>:30000"
