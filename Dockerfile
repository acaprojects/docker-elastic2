# Dockerfile for Elasticsearch + Couchbase Transport
FROM elasticsearch:2.4.6-alpine
MAINTAINER wille

# Install curl for healthcheck
RUN apk add curl

# Install head, Elasticsearch Couchbase Transport
RUN /usr/share/elasticsearch/bin/plugin install https://github.com/couchbaselabs/elasticsearch-transport-couchbase/releases/download/3.0.0-cypress/elasticsearch-transport-couchbase-3.0.0-alder-es2.4.6.zip && \
    /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head

# Copy our custom, default config
COPY config/* /usr/share/elasticsearch/config/
RUN chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/*

EXPOSE 9200 9300 9091

CMD elasticsearch
