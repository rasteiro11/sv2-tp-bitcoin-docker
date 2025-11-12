#!/bin/bash

cd "$(dirname "$0")/.."

echo "Starting Bitcoin Core + SV2 Template Provider container..."
docker compose up -d

echo "Waiting for services to initialize..."
sleep 15

docker compose ps

echo ""
echo "✓ Bitcoin Core and SV2 Template Provider are now running in the same container."
echo ""
echo "Monitor logs with: docker compose logs -f"
echo "Check service status: docker compose exec bitcoin-sv2 supervisorctl status"