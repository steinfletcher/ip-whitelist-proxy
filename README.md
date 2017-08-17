ip-whitelist-proxy
==================

Docker container based on nginx that firewalls requests and proxies them to a target.

## Environment variables

- `ALLOWED_IPS` a list of IPs delimited by `,` (without spaces) to configure the source IPs to whitelist
- `PROXY_TARGET` the upstream server to proxy requests to

Example:

     docker run -p 9000:80 -e PROXY_TARGET=example.com -e ALLOWED_IPS=211.33.2.22/32,211.33.2.48/32 steinf/ip-whitelist-proxy

<a href="https://hub.docker.com/r/steinf//">
  <img src="http://dockeri.co/image/steinf/ip-whitelist-proxy"/>
</a>