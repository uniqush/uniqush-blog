#!/bin/bash

rm -r output/
IMAGE=uniqush/uniqush-blog-build
docker build -t $IMAGE .
docker run --rm -u $UID -v $PWD:/src $IMAGE bash -c 'cd /src; make html'
