FROM busybox AS build

ARG CRUX_VERSION=3.8
ARG CRUX_MIRROR=ftp://ftp.spline.inf.fu-berlin.de/pub/crux

ENV CRUX_URL="$CRUX_MIRROR/crux-$CRUX_VERSION/iso/crux-$CRUX_VERSION.iso"

ENV BSDTAR_VERSION=v3.8.1-3
ENV BSDTAR_MIRROR=https://github.com/hermeticbuild/bsdtar-prebuilt/releases/download

RUN mkdir -p /newroot/var/lib/pkg /newroot/media && touch /newroot/var/lib/pkg/db

RUN wget "${BSDTAR_MIRROR}/${BSDTAR_VERSION}/tar_linux_amd64" -O /bin/bsdtar && chmod +x /bin/bsdtar

RUN cd newroot/media && wget "${CRUX_URL}" -O - | bsdtar -x -f - crux/core

RUN bsdtar -x -f /newroot/media/crux/core/pkgutils\#*

ADD pkgdad /usr/bin/

RUN pkgdad -r /newroot /newroot/media/crux/core/pkgutils\#*
RUN pkgdad -e 'pkgutils#*' -p /newroot /newroot/media/crux/core

FROM scratch

COPY --from=build /newroot/ /

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD [ "bash" ]
