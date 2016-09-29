FROM 5003/builder:curl
RUN addgroup -S elasticsearch && adduser -S -D -G elasticsearch elasticsearch

COPY docker-entrypoint.sh /usr/local/bin/
RUN apk add --no-cache --virtual .builder tar && \
    apk add --no-cache su-exec \
                       openjdk8-jre && \
    mkdir /usr/share/elasticsearch/ && curl --location https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.4.0/elasticsearch-2.4.0.tar.gz \
    | tar --gzip --extract --file - --directory /usr/share/elasticsearch/ --strip-components 1 && \
    apk del --no-cache .builder && \
    chmod +x /usr/local/bin/docker-entrypoint.sh

RUN for i in /usr/share/elasticsearch/data/ \
             /usr/share/elasticsearch/logs/ \
             /usr/share/elasticsearch/config/ \
             /usr/share/elasticsearch/config/scripts/ \
      ; do mkdir -p "$i" \
           ; chown --recursive elasticsearch:elasticsearch "$i" \
    ; done

ENV PATH /usr/share/elasticsearch/bin:$PATH
VOLUME /usr/share/elasticsearch/data/

EXPOSE 9200 9300
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["elasticsearch"]