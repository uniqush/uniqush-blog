# This Dockerfile is dedicated to installing webgen without fiddling around with dependencies.
FROM ubuntu:18.04
MAINTAINER Tyson Andre
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip && apt-get clean
# original: pelican-3.7.1 and Markdown-2.6.11
RUN pip3 install pelican markdown
RUN apt-get install -y curl unzip && apt-get clean
ENV THEME_VERSION=8b244609f5f6fcce30c5324cfa8b1e5c4df0e199
RUN curl -sSL https://github.com/getpelican/pelican-themes/archive/$THEME_VERSION.zip -o $THEME_VERSION.zip && \
	unzip $THEME_VERSION.zip && mv pelican-themes-$THEME_VERSION/ /pelican-themes && rm -f *.zip
RUN pelican-themes -i /pelican-themes/tuxlite_tbs
VOLUME /src
WORKDIR /src
