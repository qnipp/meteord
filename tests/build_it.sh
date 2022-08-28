#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "qnipp/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "qnipp/meteord:node-${NODE_VERSION}-base" qnipp/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "qnipp/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "qnipp/meteord:node-${NODE_VERSION}-onbuild" qnipp/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "qnipp/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "qnipp/meteord:node-${NODE_VERSION}-devbuild" qnipp/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "qnipp/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "qnipp/meteord:node-${NODE_VERSION}-binbuild" qnipp/meteord:binbuild
