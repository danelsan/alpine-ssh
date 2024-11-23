#!/bin/bash

docker build --build-arg ROOT_PASSWORD=admin -t alpine-ssh:1.0 .
