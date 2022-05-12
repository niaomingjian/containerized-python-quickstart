#!/bin/bash
app="reg.k8s.rf.io/rf/yy/containerized-python-quickstart"
name=containerized-python-quickstart
docker build -t ${app} .
docker run -d --rm -p 80:5000 \
  --name=${name} \
  -v $PWD:/app ${app}