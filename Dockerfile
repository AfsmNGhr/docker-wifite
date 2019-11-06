FROM alpine:3.10.3

RUN apk --update add pciutils && \
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
        reaver-wps-fork-t6x tshark macchanger && \
    apk add --virtual .base build-base git findutils linux-headers \
        openssl-dev zlib-dev curl-dev file && \
    git clone https://github.com/derv82/wifite2.git --depth=1 && \
    cd wifite2 && \
    python3 setup.py install && \
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
    find /usr \
         \( -type d -a -name '__pycache__' -o -name '(test|tests)' \) \
         -o \( -type f -a -name '(*.pyc|*.pxd)' -o -name '(*.pyo|*.pyd)' \) \
         -exec rm -rf '{}' + && \
    find /usr -name '*.so' -print \
         -exec sh -c 'file "{}" | grep -q "not stripped" && strip -s "{}"' \; && \
    apk del .base && \
    rm -rf /hcxtools/ /hcxdumptool/ /hashcat/ /wifite2/ /tmp/* /var/tmp/* \
           /usr/share/man /usr/local/share/doc /tmp/* /var/tmp/* /var/cache/apk/* /var/log/* ~/.cache
