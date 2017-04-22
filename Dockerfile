#
# Copyright 2015-2016 The OpenZipkin Authors
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
#
FROM openzipkin/zipkin:1.23.2
MAINTAINER OpenZipkin "http://zipkin.io/"

ENV ZIPKIN_AZURE_REPO https://jcenter.bintray.com
ENV ZIPKIN_AZURE_VERSION 0.1.5

RUN curl -SL $ZIPKIN_AZURE_REPO/io/zipkin/azure/zipkin-autoconfigure-collector-eventhub/$ZIPKIN_AZURE_VERSION/zipkin-autoconfigure-collector-eventhub-$ZIPKIN_AZURE_VERSION-module.jar > eventhub.jar

CMD test -n "$STORAGE_TYPE" && source .${STORAGE_TYPE}_profile; java ${JAVA_OPTS} -Dloader.path=eventhub.jar -Dspring.profiles.active=eventhub -cp . org.springframework.boot.loader.PropertiesLauncher
