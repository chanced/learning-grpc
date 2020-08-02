FROM envoyproxy/envoy-dev:latest

RUN apt-get update && apt-get -q install -y \
    curl
CMD /usr/local/bin/envoy -c /etc/envoy/front-envoy.yaml --service-cluster front-proxy -l trace --log-path /var/log/envoy_info.log
 