RUN add-apt-repository -y ppa:cpick/hub
RUN apt-get update
RUN apt-get install -y hub
RUN hub config --global hub.protocol https
RUN git config --global user.email "vittorio.zaccaria@gmail.com" && \
    git config --global user.name "Vittorio Zaccaria"
