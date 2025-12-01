FROM alpine:latest

RUN apk update && \
    apk add openjdk17-jdk

ENV JAVA_HOME=/usr/lib/jvm/default-jvm
ENV SPARK_HOME=/usr/lib/python3.7/site-packages/pyspark

RUN apk add bash && \
  apk add nano && \
  apk add postgresql-client && \
  apk add --update  python3 py3-pip  && \
  pip3 install pyspark  --break-system-packages --root-user-action=ignore && \
  pip3 install pytest  --break-system-packages --root-user-action=ignore

WORKDIR /src

COPY . /src
