WORKDIR /root
RUN wget -c https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip
RUN unzip exa-linux-x86_64-0.8.0.zip
RUN mv exa-linux-x86_64 /usr/local/bin/exa
