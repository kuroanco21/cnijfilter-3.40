ARG PKGNAME=cnijfilter-source-3.40-1

FROM ubuntu:24.04 AS builder

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    autoconf \
    build-essential \
    git \
    libcups2-dev \
    libglib2.0-dev \
    libgtk2.0-dev \
    libpopt-dev \
    libtiff-dev \
    libtool-bin \
    libxml2-dev

WORKDIR /build
ARG PKGNAME

RUN git clone https://aur.archlinux.org/cnijfilter-5200.git && \
    mkdir -p patches && \
    cp cnijfilter-5200/*.patch patches/
COPY ./fix_debian.patch patches/

COPY ./${PKGNAME}.tar.gz /build/
RUN tar xvzf ${PKGNAME}.tar.gz

WORKDIR /build/${PKGNAME}

RUN patch -p1 -i ../patches/fix_cups.patch && \
    patch -p1 -i ../patches/fix_include.patch && \
    patch -p1 -i ../patches/fix_png.patch  && \
    patch -p1 -i ../patches/fix_debian.patch

RUN dpkg-buildpackage -uc -us

FROM scratch AS final

COPY --from=builder /build/*.deb /
