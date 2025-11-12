#!/bin/bash

# Build the unified Docker image for Bitcoin Core and SV2 Template Provider

# Navigate to the project root directory
cd "$(dirname "$0")/.."

# Build the Docker image using docker compose
echo "Building unified Bitcoin Core + SV2 Template Provider Docker image..."
docker compose build

echo "Docker image built successfully."
echo "Both Bitcoin Core and SV2 Template Provider will run in the same container."