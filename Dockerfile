FROM ubuntu:18.04
ARG TARGETPLATFORM

LABEL maintainer="Daniel S. <azrael783@live.de>"
LABEL name="tor-socks-proxy"
LABEL description="A simple tor socks proxy running official Tor Project packages."
LABEL version="latest"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y && \
    apt install apt-utils -y && \
    apt install tor -y && \
    chmod 700 /var/lib/tor && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean && \
    tor --version

COPY torrc /etc/tor/

HEALTHCHECK --timeout=10s --start-period=60s \
    CMD curl --fail --socks5-hostname localhost:9150 -I -L 'https://www.facebookcorewwwi.onion/' || exit 1

EXPOSE 53/udp 9150/tcp

CMD ["/usr/bin/tor", "-f", "/etc/tor/torrc"]
