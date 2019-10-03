WORKDIR /root

RUN add-apt-repository -y ppa:kelleyk/emacs
RUN apt-get update
RUN apt-get install -y emacs25
RUN git clone https://github.com/syl20bnr/spacemacs /root/.emacs.d

RUN cd /root/.emacs.d && git checkout tags/v0.200.13
WORKDIR /root/dotfiles
RUN stow spacemacs

# ADD https://github.com/adobe-fonts/source-code-pro/archive/2.010R-ro/1.030R-it.zip /tmp/scp.zip
# ADD http://www.ffonts.net/NanumGothic.font.zip /tmp/ng.zip

RUN mkdir -p /usr/local/share/fonts               && \
    unzip /tmp/ng.zip -d /usr/local/share/fonts   && \
    chown ${uid}:${gid} -R /usr/local/share/fonts && \
    chmod 777 -R /usr/local/share/fonts           && \
    fc-cache -fv                                  && \
    npm install -g tern js-beautify && \

RUN emacs --insecure -nw -batch -u "${UNAME}" -q -kill; exit 0
RUN emacs --insecure -nw -batch -u "${UNAME}" -q -kill; exit 0

# Fix for spacemacs org-mode. It will be reinstalled at next startup 
# Unfortunately, this will give an error on org-projectile (only at the first start)
RUN rm -rf /root/.emacs.d/elpa/org-*
