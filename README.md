[![Build Status](https://travis-ci.org/openzipkin/docker-zipkin-azure.svg)](https://travis-ci.org/openzipkin/docker-zipkin-azure)
[![zipkin-azure](https://quay.io/repository/openzipkin/zipkin-azure/status "zipkin-azure")](https://quay.io/repository/openzipkin/zipkin-azure)

# docker-zipkin-azure

This repository contains the Docker build definition and release process for
[openzipkin/zipkin-azure](https://github.com/openzipkin/zipkin-azure).

This layers Microsoft Azure support on the base [zipkin docker image](https://github.com/openzipkin/docker-zipkin).

Currently, this adds Event Hub Collector support

## Running

You can use any existing env variables from Zipkin. Here's adding the variables needed for Event Hub:

```bash
docker run \
-e 'EVENTHUB_CONNECTION_STRING=Endpoint=sb://your_eventhub_address;SharedAccessKeyName=your_key_name;SharedAccessKey=your_key' \
-e 'EVENTHUB_STORAGE_CONNECTION_STRING=DefaultEndpointsProtocol=https;AccountName=your_account_name;AccountKey=your_account_key' \
-d -p 9411:9411 openzipkin/zipkin-azure
```

## Configuration

Configuration is via environment variables, defined by [zipkin-azure](https://github.com/openzipkin/zipkin-azure/blob/master/README.md).

In docker, the following can also be set:

    * `JAVA_OPTS`: Use to set java arguments, such as heap size or trust store location.

### Event Hub

Event Hub Configuration variables are detailed [here](https://github.com/openzipkin/zipkin-azure/tree/master/collector/eventhub).
