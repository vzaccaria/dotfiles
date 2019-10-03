
RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash ./nodesource_setup.sh
RUN git clone https://github.com/vzaccaria/vz-clitools.git /root/clitools
WORKDIR /root/clitools
RUN npm link .
