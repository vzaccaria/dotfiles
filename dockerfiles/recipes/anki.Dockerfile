RUN apt-get install -y pulseaudio && \

    # Desktop utilities required by Anki
    apt-get install -y xdg-utils && \

    # Audio and video tools required by Anki
    apt-get install -y mplayer lame sox && \

    # i18n lib required by Anki
    #apt-get install -y libicu48 && \

    # Utilities to install Anki
    apt-get install -y wget build-essential 

    # Install locales, since UTF-8 is required by Anki
RUN apt-get install -y locales

RUN mkdir -p /root/.local/share/applications
RUN mkdir -p /root/.config

RUN apt-get install -y  anki

RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

RUN mkdir -p /root/Documents/Anki/addons
RUN git clone https://github.com/Stvad/CrowdAnki.git
RUN mv /root/CrowdAnki/crowd_anki_importer.py /root/Documents/Anki/addons/
RUN mv /root/CrowdAnki/crowd_anki /root/Documents/Anki/addons/
RUN git clone http://github.com/vzaccaria/pandoc-anki
RUN cd pandoc-anki && stack setup && stack install

RUN apt-get install -y dvipng
RUN git clone https://github.com/vzaccaria/anki-cards && mkdir -p cards/Algebra && /root/.local/bin/pandoc-anki anki-cards/Algebra.org -j > cards/Algebra/Algebra.json


