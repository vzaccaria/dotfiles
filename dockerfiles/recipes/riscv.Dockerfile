
RUN apt-get install -y autoconf automake autotools-dev curl \
    libmpc-dev libmpfr-dev libgmp-dev gawk build-essential \
    bison flex texinfo gperf libtool patchutils bc zlib1g-dev
WORKDIR /root
RUN git clone https://github.com/riscv/riscv-gnu-toolchain.git
WORKDIR /root/riscv-gnu-toolchain
RUN git submodule update --init --recursive
RUN ./configure --prefix=/opt/riscv/toolchain
RUN make
RUN sudo make install
WORKDIR /root
RUN git clone https://github.com/rv8-io/rv8.git
WORKDIR /root/rv8
RUN git submodule update --init --recursive
RUN make
RUN sudo make install


