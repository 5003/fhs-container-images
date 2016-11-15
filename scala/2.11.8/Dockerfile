FROM neec/buildpack-deps:curl

RUN apk add --no-cache --virtual .buildpack-deps tar && \

    apk add --no-cache openjdk8-jre \
                       # needed by the sbt
                       bash && \

    set -e && for i in \
      http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz \
      https://dl.bintray.com/sbt/native-packages/sbt/0.13.13/sbt-0.13.13.tgz \
      ; do curl --location --insecure $i \
        | tar --gzip --extract --file - --directory /usr/local/ --strip-components 1 \
    ; done && \

    apk del --no-cache .buildpack-deps

RUN sbt about