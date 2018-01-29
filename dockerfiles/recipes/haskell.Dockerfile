RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | apt-key add - && \
    echo 'deb http://download.fpcomplete.com/ubuntu trusty main' | tee /etc/apt/sources.list.d/fpco.list && \
    apt-get update && apt-get install stack -y
ENV PATH /root/.local/bin:$PATH
RUN stack upgrade
RUN stack setup
