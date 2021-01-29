# tor-socks-proxy

A small tor proxy image to use with our lovely Raspberry Pi. 

# Usage

Setup the proxy server for the first time:

`docker run -d -p 9150:9150 --name=tor-socks-proxy --restart=unless-stopped azrael783/tor-socks-proxy`
