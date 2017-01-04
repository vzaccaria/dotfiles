RUN apt-get update
RUN apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver
ADD ./scripts /root/
