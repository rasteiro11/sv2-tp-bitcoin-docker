# Bitcoin Core + SV2 Template Provider Docker

Run Bitcoin Core and SV2 Template Provider together in a single Docker container with IPC communication.

## Quick Start

```bash
# Build the image
./scripts/build.sh

# Start the container
./scripts/run.sh

# Stop the container
./scripts/stop.sh
```

## What's Running

Both services run in one container managed by **supervisord**:
- **Bitcoin Core** (testnet) - syncing blockchain
- **SV2 Template Provider** - providing Stratum V2 templates

## Monitor Services

View logs (last 200 lines + follow):
```bash
docker compose logs -f --tail=200 bitcoin-sv2
```

Check service status:
```bash
docker compose exec bitcoin-sv2 supervisorctl status
```

Check Bitcoin sync progress:
```bash
docker compose exec bitcoin-sv2 bitcoin-cli -testnet getblockchaininfo
```

## Configuration Files

- `configs/bitcoin/bitcoin.conf` - Bitcoin Core settings (testnet, RPC, IPC)
- `configs/sv2-tp/sv2-tp.conf` - SV2 Template Provider settings

## Ports

- **18332** - Bitcoin RPC (testnet)
- **18333** - Bitcoin P2P (testnet)  
- **8442** - SV2 Template Provider

## Troubleshooting

You can monitor both services using these commands:

```bash
# View all logs
docker-compose logs -f

# View Bitcoin Core logs only
docker-compose exec bitcoin-sv2 supervisorctl tail -f bitcoind

# View SV2 Template Provider logs only
docker-compose exec bitcoin-sv2 supervisorctl tail -f sv2-tp

# Check service status
docker-compose exec bitcoin-sv2 supervisorctl status

# Access Bitcoin Core CLI
docker-compose exec bitcoin-sv2 bitcoin-cli -testnet -rpcuser=username -rpcpassword=password getblockchaininfo
```