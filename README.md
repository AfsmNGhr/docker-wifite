## Dockerized wifite based on alpine image

![https://travis-ci.org/AfsmNGhr/docker-wifite](https://travis-ci.org/AfsmNGhr/docker-wifite.svg?branch=master)
![https://microbadger.com/images/afsmnghr/docker-wifite](https://images.microbadger.com/badges/version/afsmnghr/docker-wifite.svg)
![https://microbadger.com/images/afsmnghr/wifite](https://images.microbadger.com/badges/image/afsmnghr/wifite.svg)
![https://hub.docker.com/r/afsmnghr/wifite/](https://img.shields.io/docker/pulls/afsmnghr/wifite.svg?style=flat-square)
![https://hub.docker.com/r/afsmnghr/wifite/](https://img.shields.io/docker/stars/afsmnghr/wifite.svg?style=flat-square)

```sh
kalilinux/kali-linux-docker 1.57GB
kali + wifite 398MB (with export / import technique)
```

#### How to use

```sh
docker run -it --rm --net="host" --privileged afsmnghr/wifite wifite
```

For advanced usage:

```sh
docker run -it --rm --net="host" --privileged afsmnghr/wifite sh
```
