FROM ubuntu:22.04

ENV BITCOIN_VERSION=30.0
ENV BITCOIN_DATA=/root/.bitcoin
ENV DEBIAN_FRONTEND=noninteractive
ENV RUST_VERSION=stable

RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    supervisor \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Bitcoin Core
RUN wget https://bitcoincore.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    tar -xzf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz && \
    install -m 0755 -o root -g root -t /usr/local/bin bitcoin-${BITCOIN_VERSION}/bin/* && \
    rm -rf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz bitcoin-${BITCOIN_VERSION}

# Download and install SV2 Template Provider pre-built binary
RUN wget https://github.com/stratum-mining/sv2-tp/releases/download/v1.0.3/sv2-tp-1.0.3-x86_64-linux-gnu.tar.gz && \
    tar -xzf sv2-tp-1.0.3-x86_64-linux-gnu.tar.gz && \
    install -m 0755 -o root -g root -t /usr/local/bin sv2-tp-1.0.3/bin/* && \
    rm -rf sv2-tp-1.0.3-x86_64-linux-gnu.tar.gz sv2-tp-1.0.3

# Create bitcoin data directory
RUN mkdir -p ${BITCOIN_DATA}

# Copy supervisor configuration
COPY ./docker/bitcoin-sv2/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 18332 18333 8442

# Start supervisor to manage both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
