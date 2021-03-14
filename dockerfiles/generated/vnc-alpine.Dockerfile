FROM archlinux:base-devel


RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst \
    && curl -LO "https://raw.githubusercontent.com/sickcodes/Docker-OSX/master/${patched_glibc}" \
    && bsdtar -C / -xvf "${patched_glibc}" || echo "Everything is fine."

RUN sudo pacman -Sy tigervnc --noconfirm

WORKDIR /root
COPY scripts/startx ./

RUN mkdir Desktop .vnc && \
    echo "startlxde" > .vnc/xstartup && \
    chmod +x startx .vnc/xstartup
RUN sudo pacman -Sy expect --noconfirm
CMD ["/root/startx"]





