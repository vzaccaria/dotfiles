

RUN apt-get build-dep -y emacs24
RUN mkdir -p /root/emacs
WORKDIR /root/emacs
RUN wget ftp.gnu.org/gnu/emacs/emacs-24.4.tar.xz
RUN tar -xf emacs-24.4.tar.xz
WORKDIR /root/emacs/emacs-24.4
RUN ./configure
RUN make install

