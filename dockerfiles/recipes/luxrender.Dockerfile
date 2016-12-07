# Dockerfile for tasks requiring LuxRender.

RUN apt-get update && \
    apt-get install -y \
    curl \
    bzip2 \
    libglu1-mesa \
    libgomp1 && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/*

ENV LUXRENDER_BZ2_URL http://www.luxrender.net/release/luxrender/1.6/linux/lux-v1.6-x86_64-sse2-NoOpenCL.tar.bz2

RUN curl -SL ${LUXRENDER_BZ2_URL} | tar -xjv -C /opt

ENV LIBEMBREE_URL https://github.com/embree/embree/releases/download/v2.13.0/embree-2.13.0.x86_64.linux.tar.gz
RUN curl -SL ${LIBEMBREE_URL} > lib.tgz
RUN tar -xvf lib.tgz -C /opt

RUN ln -s /opt/lux-v1.5.1-x86_64-sse2 /opt/luxrender
RUN ln -s /opt/embree-2.13.0.x86_64.linux /opt/embree

ENV PATH=/opt/luxrender:$PATH LUXRENDER_ROOT=/opt/luxrender LD_LIBRARY_PATH=/opt/embree/lib:$LD_LIBRARY_PATH
RUN apt-get update && apt-get install -y p7zip-full
RUN mkdir -p /opt/examples && curl -SL http://cg.tuwien.ac.at/~zsolnai/luxrender-scenes/LuxBlend_Testscene.7z > /opt/examples/test.7z


