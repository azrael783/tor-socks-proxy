# tor-socks-proxy

A small tor proxy image without relay/exit feature to use with our lovely Raspberry Pi, or other ARM featured platforms and also "normal" Linux platforms (I just had fun to build up the CI/CD with Github :-) ). Inspired by [this blog](https://www.blog.berrybase.de/blog/2021/01/16/tor-proxy-server-so-surfst-du-anonym-mit-dem-pi/) post and the images from [peterdavehello](https://hub.docker.com/r/peterdavehello/tor-socks-proxy) and [x86txt](https://hub.docker.com/r/x86txt/tor-socks-proxy) I decided to create my own image for the "ARM" platform to run on a Rasperry Pi for example.

# Usage

1. Setup the proxy server for the first time:

`$ docker run -d -p 9150:9150 --name=tor-socks-proxy --restart=unless-stopped azrael783/tor-socks-proxy`

2. Check if the server runs correctly (give it some time to start up).



```
$ docker logs -f tor-socks-proxy
.
.
.
Jan 31 21:15:30.000 [notice] Bootstrapped 67%: Loading relay descriptors
Jan 31 21:15:30.000 [notice] Bootstrapped 72%: Loading relay descriptors
Jan 31 21:15:30.000 [notice] Bootstrapped 80%: Connecting to the Tor network
Jan 31 21:15:31.000 [notice] Bootstrapped 85%: Finishing handshake with first hop
Jan 31 21:15:31.000 [notice] Bootstrapped 90%: Establishing a Tor circuit
Jan 31 21:15:32.000 [notice] Tor has successfully opened a circuit. Looks like client functionality is working.
Jan 31 21:15:32.000 [notice] Bootstrapped 100%: Done
```

3. Configure your browser to use SOCKS5 proxy with the IP where the container is running. In Firefox for example go to Settings --> Network Settings

[logo]: https://github.com/azrael783/tor-socks-proxy/browser-settings.png "Firefox proxy settings"

4. Check if tor works correctly using [this](https://check.torproject.org/?lang=de) website.



5. If you don't want to use the proxy anymore, stop the container with `docker stop tor-socks-proxy` and don't forget to reset the proxy settings in your browser or use another without the proxy setting.

6. If you want to reuse the proxy, start it with `docker start tor-socks-proxy`




