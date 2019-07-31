FROM python:3.7.4-alpine3.10

RUN apk --update add pciutils && \
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        reaver-wps-fork-t6x && \
    apk add --virtual .base build-base git findutils linux-headers \
            openssl-dev zlib-dev curl-dev && \
    git clone https://github.com/derv82/wifite2.git --depth=1 && \
    cd wifite2 && \
    python setup.py install && \
    cd / && \
    git clone https://github.com/ZerBea/hcxdumptool.git --depth=1 && \
    cd hcxdumptool && \
    make && \
    make install && \
    cd / && \
    git clone https://github.com/ZerBea/hcxtools.git --depth=1 && \
    cd hcxtools && \
    make && \
    make install && \
    git clone https://github.com/hashcat/hashcat.git --depth=1 && \
    cd hashcat && \
    make && \
    make install && \
    cd / && \
    apk del .base && \
    rm -rf /hcxtools/ /hcxdumptool/ /hashcat/ /wifite2/ /tmp/* /var/tmp/* \
           /usr/share/man /tmp/* /var/tmp/* /var/cache/apk/* /var/log/* ~/.cache
