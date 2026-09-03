# Builds the blog with Pelican. Run via ./main.sh.
FROM python:3.12-slim
RUN pip install --no-cache-dir pelican markdown
RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*
ENV THEME_VERSION=8b244609f5f6fcce30c5324cfa8b1e5c4df0e199
RUN git clone --filter=blob:none --no-checkout https://github.com/getpelican/pelican-themes.git /pelican-themes && \
    cd /pelican-themes && git sparse-checkout set tuxlite_tbs && git checkout -q $THEME_VERSION && \
    pelican-themes -i /pelican-themes/tuxlite_tbs
VOLUME /src
WORKDIR /src
