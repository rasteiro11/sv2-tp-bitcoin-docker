#!/bin/bash

cd "$(dirname "$0")/.."

echo "Stopping Bitcoin Core + SV2 Template Provider container..."
docker compose down

echo "Container stopped and removed."

# Optionally, remove any stopped containers, networks, images, and volumes
# Uncomment the following line if you want to clean up all unused resources
# docker system prune -af --volumes