$ErrorActionPreference = "Stop"

$DOCKER_ID = "aravindroy1"

$services = @(
    "notification-service",
    "Bookingservice",
    "EventService",
    "user-service",
    "Payment",
    "Ticket-Generator"
)

# Optional: Prompt for docker login or assume user is already logged in
# docker login -u $DOCKER_ID

foreach ($service in $services) {
    Write-Host "================================="
    Write-Host "Building and pushing $service..."
    Write-Host "================================="

    # Define the image name (lowercased)
    $imageName = "$DOCKER_ID/$($service.ToLower()):latest"

    Set-Location "C:\Users\aravi\.gemini\antigravity\scratch\EVent-Management\$service"

    # Build the image
    Write-Host "Running: docker build -t $imageName ."
    docker build -t $imageName .

    # Push the image
    Write-Host "Running: docker push $imageName"
    docker push $imageName
}

Set-Location "C:\Users\aravi\.gemini\antigravity\scratch\EVent-Management"
Write-Host "All images built and pushed successfully to $DOCKER_ID registry."
