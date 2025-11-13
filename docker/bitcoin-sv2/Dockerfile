FROM ubuntu:22.04

ENV BITCOIN_DATA=/root/.bitcoin
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    supervisor \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Fetch and extract Bitcoin Core v30 (no system-wide install)
RUN wget https://bitcoincore.org/bin/bitcoin-core-30.0/bitcoin-30.0-x86_64-linux-gnu.tar.gz && \
    tar -xzf bitcoin-30.0-x86_64-linux-gnu.tar.gz && \
    mkdir -p /opt && \
    mv bitcoin-30.0 /opt/bitcoin-30.0 && \
    rm -f bitcoin-30.0-x86_64-linux-gnu.tar.gz

# Download and extract SV2 Template Provider pre-built binary (no system-wide install)
RUN wget https://github.com/stratum-mining/sv2-tp/releases/download/v1.0.3/sv2-tp-1.0.3-x86_64-linux-gnu.tar.gz && \
    tar -xzf sv2-tp-1.0.3-x86_64-linux-gnu.tar.gz && \
    mkdir -p /opt && \
    mv sv2-tp-1.0.3 /opt/sv2-tp-1.0.3 && \
    rm -f sv2-tp-1.0.3-x86_64-linux-gnu.tar.gz

# Create bitcoin data directory
RUN mkdir -p ${BITCOIN_DATA}

# Copy supervisor configuration
COPY ./docker/bitcoin-sv2/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 18332 18333 8442 9051 48332

VOLUME ["/root/.bitcoin"]

# Start supervisor to manage both services
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
