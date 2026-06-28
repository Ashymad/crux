ARG CRUX_VERSION=3.8

FROM crux:${CRUX_VERSION}-stage1 AS build

ENV CRUX_VERSION=${CRUX_VERSION}
ENV CRUX_REPO=/newroot/media/crux/core

RUN mkdir -p /newroot/var/lib/pkg $CRUX_REPO && touch /newroot/var/lib/pkg/db

RUN ports -u

FROM build AS build:autoconf
RUN cd /usr/ports/core/autoconf && pkgmk -d && mv -v "autoconf#2.73-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:ca-certificates
RUN cd /usr/ports/core/ca-certificates && pkgmk -d && mv -v "ca-certificates#20260514-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:dash
RUN cd /usr/ports/core/dash && pkgmk -d && mv -v "dash#0.5.13.4-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:dhcpcd
RUN cd /usr/ports/core/dhcpcd && pkgmk -d && mv -v "dhcpcd#10.3.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:ed
RUN cd /usr/ports/core/ed && pkgmk -d && mv -v "ed#1.22.5-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:expat
RUN cd /usr/ports/core/expat && pkgmk -d && mv -v "expat#2.8.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:file
COPY --from=build:zstd $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/file && pkgmk -d && mv -v "file#5.48-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:filesystem
RUN cd /usr/ports/core/filesystem && pkgmk -d && mv -v "filesystem#3.8-3.pkg.tar.gz" $CRUX_REPO
FROM build AS build:glibc
RUN cd /usr/ports/core/glibc && pkgmk -d && mv -v "glibc#2.40-3.pkg.tar.gz" $CRUX_REPO
FROM build AS build:glibc-32
RUN cd /usr/ports/core/glibc-32 && pkgmk -d && mv -v "glibc-32#2.40-3.pkg.tar.gz" $CRUX_REPO
FROM build AS build:gperf
RUN cd /usr/ports/core/gperf && pkgmk -d && mv -v "gperf#3.3-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:groff
RUN cd /usr/ports/core/groff && pkgmk -d && mv -v "groff#1.24.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:jansson
RUN cd /usr/ports/core/jansson && pkgmk -d && mv -v "jansson#2.15.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:jsoncpp
RUN cd /usr/ports/core/jsoncpp && pkgmk -d && mv -v "jsoncpp#1.9.8-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:kbd
RUN cd /usr/ports/core/kbd && pkgmk -d && mv -v "kbd#2.10.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libarchive
COPY --from=build:zstd $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/libarchive && pkgmk -d && mv -v "libarchive#3.8.8-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libcap-ng
RUN cd /usr/ports/core/libcap-ng && pkgmk -d && mv -v "libcap-ng#0.9.3-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libedit
RUN cd /usr/ports/core/libedit && pkgmk -d && mv -v "libedit#20260512-3.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libffi
RUN cd /usr/ports/core/libffi && pkgmk -d && mv -v "libffi#3.6.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libmd
RUN cd /usr/ports/core/libmd && pkgmk -d && mv -v "libmd#1.2.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libmpc
RUN cd /usr/ports/core/libmpc && pkgmk -d && mv -v "libmpc#1.4.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libnftnl
RUN cd /usr/ports/core/libnftnl && pkgmk -d && mv -v "libnftnl#1.3.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libnghttp2
RUN cd /usr/ports/core/libnghttp2 && pkgmk -d && mv -v "libnghttp2#1.69.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libpcre2
RUN cd /usr/ports/core/libpcre2 && pkgmk -d && mv -v "libpcre2#10.47-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libtirpc
RUN cd /usr/ports/core/libtirpc && pkgmk -d && mv -v "libtirpc#1.3.7-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libusb
RUN cd /usr/ports/core/libusb && pkgmk -d && mv -v "libusb#1.0.30-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libuv
RUN cd /usr/ports/core/libuv && pkgmk -d && mv -v "libuv#1.52.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:linux-pam
RUN cd /usr/ports/core/linux-pam && pkgmk -d && mv -v "linux-pam#1.7.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:lzlib
RUN cd /usr/ports/core/lzlib && pkgmk -d && mv -v "lzlib#1.16-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:m4
RUN cd /usr/ports/core/m4 && pkgmk -d && mv -v "m4#1.4.21-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:man-pages
RUN cd /usr/ports/core/man-pages && pkgmk -d && mv -v "man-pages#6.18-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:mpdecimal
RUN cd /usr/ports/core/mpdecimal && pkgmk -d && mv -v "mpdecimal#4.0.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:nasm
RUN cd /usr/ports/core/nasm && pkgmk -d && mv -v "nasm#3.01-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:ncurses
RUN cd /usr/ports/core/ncurses && pkgmk -d && mv -v "ncurses#6.6-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:openssl
RUN cd /usr/ports/core/openssl && pkgmk -d && mv -v "openssl#3.6.3-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:pciutils
RUN cd /usr/ports/core/pciutils && pkgmk -d && mv -v "pciutils#3.15.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:pkgconf
RUN cd /usr/ports/core/pkgconf && pkgmk -d && mv -v "pkgconf#2.5.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:prt-get
RUN cd /usr/ports/core/prt-get && pkgmk -d && mv -v "prt-get#5.19.9-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:rc
RUN cd /usr/ports/core/rc && pkgmk -d && mv -v "rc#2.35.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:rdate
RUN cd /usr/ports/core/rdate && pkgmk -d && mv -v "rdate#0.14-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:rhash
RUN cd /usr/ports/core/rhash && pkgmk -d && mv -v "rhash#1.4.6-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:sed
RUN cd /usr/ports/core/sed && pkgmk -d && mv -v "sed#4.10-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:signify
RUN cd /usr/ports/core/signify && pkgmk -d && mv -v "signify#0.14-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:time
RUN cd /usr/ports/core/time && pkgmk -d && mv -v "time#1.10-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:tzdata
RUN cd /usr/ports/core/tzdata && pkgmk -d && mv -v "tzdata#2026b-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:which
RUN cd /usr/ports/core/which && pkgmk -d && mv -v "which#2.25-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:xz
RUN cd /usr/ports/core/xz && pkgmk -d && mv -v "xz#5.8.3-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:zlib
RUN cd /usr/ports/core/zlib && pkgmk -d && mv -v "zlib#1.3.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libxcrypt
COPY --from=build:glibc $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/libxcrypt && pkgmk -d && mv -v "libxcrypt#4.5.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libxcrypt-32
COPY --from=build:glibc-32 $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/libxcrypt-32 && pkgmk -d && mv -v "libxcrypt-32#4.5.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:pkgutils
COPY --from=build:libarchive $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/pkgutils && pkgmk -d && mv -v "pkgutils#5.40.12-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libbsd
COPY --from=build:libmd $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/libbsd && pkgmk -d && mv -v "libbsd#0.12.2-2.pkg.tar.gz" $CRUX_REPO
FROM build AS build:gcc
COPY --from=build:libmpc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zstd $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/gcc && pkgmk -d && mv -v "gcc#14.4.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:grep
COPY --from=build:libpcre2 $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/grep && pkgmk -d && mv -v "grep#3.12-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:usbutils
COPY --from=build:libusb $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/usbutils && pkgmk -d && mv -v "usbutils#019-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libcap
COPY --from=build:linux-pam $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/libcap && pkgmk -d && mv -v "libcap#2.78-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:vim
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/vim && pkgmk -d && mv -v "vim#9.2.0735-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:readline
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/readline && pkgmk -d && mv -v "readline#8.3.3-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:psmisc
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/psmisc && pkgmk -d && mv -v "psmisc#23.7-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:procps
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/procps && pkgmk -d && mv -v "procps#4.0.6-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:less
COPY --from=build:libpcre2 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/less && pkgmk -d && mv -v "less#704-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:gettext
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/gettext && pkgmk -d && mv -v "gettext#1.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:rsync
COPY --from=build:openssl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zstd $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/rsync && pkgmk -d && mv -v "rsync#3.4.4-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:curl
COPY --from=build:libnghttp2 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:openssl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zstd $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/curl && pkgmk -d && mv -v "curl#8.21.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:zstd
COPY --from=build:xz $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/zstd && pkgmk -d && mv -v "zstd#1.5.7-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:sudo
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:linux-pam $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/sudo && pkgmk -d && mv -v "sudo#1.9.17p2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:elfutils
COPY --from=build:xz $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/elfutils && pkgmk -d && mv -v "elfutils#0.195-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:binutils
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/binutils && pkgmk -d && mv -v "binutils#2.43.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:sysvinit
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/sysvinit && pkgmk -d && mv -v "sysvinit#3.18-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:shadow
COPY --from=build:libbsd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:linux-pam $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/shadow && pkgmk -d && mv -v "shadow#4.19.4-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:openssh
COPY --from=build:libmd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:linux-pam $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:openssl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/openssh && pkgmk -d && mv -v "openssh#10.3p1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:exim
COPY --from=build:libpcre2 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:openssl $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/exim && pkgmk -d && mv -v "exim#4.99.4-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:coreutils
COPY --from=build:libcap $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/coreutils && pkgmk -d && mv -v "coreutils#9.11-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:sqlite3
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/sqlite3 && pkgmk -d && mv -v "sqlite3#3.53.3-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:inetutils
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/inetutils && pkgmk -d && mv -v "inetutils#2.8-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:gdbm
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/gdbm && pkgmk -d && mv -v "gdbm#1.26-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:gawk
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/gawk && pkgmk -d && mv -v "gawk#5.4.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:bc
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/bc && pkgmk -d && mv -v "bc#1.08.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:bash
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/bash && pkgmk -d && mv -v "bash#5.3.15-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:bison
COPY --from=build:gettext $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/bison && pkgmk -d && mv -v "bison#3.8.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:httpup
COPY --from=build:curl $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/httpup && pkgmk -d && mv -v "httpup#0.5.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:cmake
COPY --from=build:curl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:expat $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:jsoncpp $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libarchive $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libuv $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:lzlib $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:rhash $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/cmake && pkgmk -d && mv -v "cmake#3.31.12-2.pkg.tar.gz" $CRUX_REPO
FROM build AS build:util-linux
COPY --from=build:file $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libcap-ng $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:linux-pam $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:sqlite3 $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/util-linux && pkgmk -d && mv -v "util-linux#2.42.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:python3
COPY --from=build:expat $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gdbm $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libffi $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libtirpc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:mpdecimal $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:sqlite3 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:xz $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/python3 && pkgmk -d && mv -v "python3#3.12.13-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:perl
COPY --from=build:gdbm $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libtirpc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/perl && pkgmk -d && mv -v "perl#5.40.4-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:man-db
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gdbm $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/man-db && pkgmk -d && mv -v "man-db#2.13.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:ninja
COPY --from=build:cmake $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/ninja && pkgmk -d && mv -v "ninja#1.13.2-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:libdevmapper
COPY --from=build:util-linux $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/libdevmapper && pkgmk -d && mv -v "libdevmapper#1.02.215-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:e2fsprogs
COPY --from=build:util-linux $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/e2fsprogs && pkgmk -d && mv -v "e2fsprogs#1.47.4-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:python3-setuptools
COPY --from=build:python3 $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/python3-setuptools && pkgmk -d && mv -v "python3-setuptools#82.0.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:nftables
COPY --from=build:jansson $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libedit $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libnftnl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:python3 $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/nftables && pkgmk -d && mv -v "nftables#1.1.6-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:automake
COPY --from=build:autoconf $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gawk $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:perl $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/automake && pkgmk -d && mv -v "automake#1.18.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:meson
COPY --from=build:python3-setuptools $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/meson && pkgmk -d && mv -v "meson#1.11.1-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:iptables
COPY --from=build:nftables $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/iptables && pkgmk -d && mv -v "iptables#1.8.13-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:iproute2
COPY --from=build:elfutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:iptables $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libcap $CRUX_REPO/ $CRUX_REPO/
ADD prtlbx pkgdad /usr/bin/
RUN pkgdad -a $CRUX_REPO
RUN cd /usr/ports/core/iproute2 && pkgmk -d && mv -v "iproute2#7.1.0-1.pkg.tar.gz" $CRUX_REPO
FROM build AS build:all
COPY --from=build:autoconf $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:ca-certificates $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:dash $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:dhcpcd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:ed $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:expat $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:file $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:filesystem $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:glibc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:glibc-32 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gperf $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:groff $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:jansson $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:jsoncpp $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:kbd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libarchive $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libcap-ng $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libedit $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libffi $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libmd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libmpc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libnftnl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libnghttp2 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libpcre2 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libtirpc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libusb $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libuv $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:linux-pam $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:lzlib $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:m4 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:man-pages $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:mpdecimal $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:nasm $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:ncurses $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:openssl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:pciutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:pkgconf $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:prt-get $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:rc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:rdate $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:rhash $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:sed $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:signify $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:time $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:tzdata $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:which $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:xz $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zlib $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libxcrypt-32 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:pkgutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libbsd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gcc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:grep $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:usbutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libcap $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:vim $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:readline $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:psmisc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:procps $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:less $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gettext $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:rsync $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:curl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:zstd $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:sudo $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:elfutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:binutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:sysvinit $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:shadow $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:openssh $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:exim $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:coreutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:sqlite3 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:inetutils $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gdbm $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:gawk $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:bc $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:bash $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:bison $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:httpup $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:cmake $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:util-linux $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:python3 $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:perl $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:man-db $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:ninja $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:libdevmapper $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:e2fsprogs $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:python3-setuptools $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:nftables $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:automake $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:meson $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:iptables $CRUX_REPO/ $CRUX_REPO/
COPY --from=build:iproute2 $CRUX_REPO/ $CRUX_REPO/

ADD prtlbx pkgdad /usr/bin/

RUN prtlbx -sl core | while read -r pkg; do \
    [ -f "$CRUX_REPO/$pkg#"*.pkg.tar.* ] || cp -v "/media/crux/core/$pkg#"*.pkg.tar.* $CRUX_REPO; \
    done

RUN pkgdad -r /newroot /newroot/media/crux/core/pkgutils\#*
RUN pkgdad -e 'pkgutils#*' -p /newroot /newroot/media/crux/core

FROM scratch

COPY --from=build:all /newroot/ /

ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD [ "bash" ]
