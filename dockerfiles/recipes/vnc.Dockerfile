RUN \
    apt-get update && \
    apt-get install -y \
            lxde ttf-dejavu \
            x11-utils \
            libfontenc1 \
            libtasn1-3-bin \
            libxfont1 \
            x11-xkb-utils && \
    apt-get remove vnc4server -y && \
    wget -O tigervnc.deb "https://bintray.com/tigervnc/stable/download_file?file_path=ubuntu-16.04LTS%2Famd64%2Ftigervncserver_1.7.0-1ubuntu1_amd64.deb" && \
    dpkg -i tigervnc.deb && \
    apt install -f -y && \
    rm tigervnc.deb

WORKDIR /root
COPY scripts/startx ./

RUN mkdir Desktop .vnc && \
	  echo "startlxde" > .vnc/xstartup && \
    chmod +x startx .vnc/xstartup
RUN apt-get install -y expect
CMD ["/root/startx"]

WORKDIR /root/dotfiles
RUN stow urxvt

WORKDIR /root
RUN apt-get install -y terminator dmenu

RUN mkdir -p temp
WORKDIR /root/temp
RUN git clone https://www.github.com/Airblader/i3 i3-gaps
WORKDIR /root/temp/i3-gaps
RUN autoreconf --force --install
RUN mkdir -p build
WORKDIR /root/temp/i3-gaps/build

RUN add-apt-repository -y ppa:aguignard/ppa
RUN apt-get update
RUN apt-get install -y libxcb-xrm-dev

RUN apt-get install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev \
  libxcb-util0-dev libxcb-icccm4-dev libyajl-dev \
  libstartup-notification0-dev libxcb-randr0-dev \
  libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
  libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev \
  autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev feh

RUN ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
RUN make
RUN make install

WORKDIR /root/dotfiles
RUN stow i3
WORKDIR /root
RUN echo "i3" > .vnc/xstartup
RUN chmod +x .vnc/xstartup
RUN apt-get install -y i3status

RUN sed -ri 's/Mod4/Mod1/' /root/.i3/config

RUN apt-get install zathura texlive-full -y


