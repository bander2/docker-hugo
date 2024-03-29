FROM ubuntu

ENV HUGO_VERSION="0.113.0"

RUN buildDeps="wget" \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps \
	&& wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz \
		-O /hugo.tar.gz --secure-protocol=TLSv1 \
	&& tar xvzf /hugo.tar.gz \
	&& mv /hugo /usr/local/bin/hugo \
	&& rm /hugo.tar.gz \
	&& apt-get remove -y $buildDeps \
	&& apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir /app

WORKDIR /app
