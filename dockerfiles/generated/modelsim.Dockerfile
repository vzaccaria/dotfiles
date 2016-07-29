FROM    ubuntu:trusty


RUN mkdir -p /root/modelsim
WORKDIR /root/modelsim
RUN wget http://download.altera.com/akdlm/software/acdsinst/13.1/162/ib_installers/ModelSimSetup-13.1.0.162.run
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y build-essential gcc-multilib g++-multilib \
	lib32z1 lib32stdc++6 lib32gcc1 \
	expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libc6:i386 libgtk-3-0:i386 \
	libcanberra0:i386 libpng12-0:i386 libice6:i386 libsm6:i386 libncurses5:i386 zlib1g:i386 \
	libx11-6:i386 libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
	libxt6:i386 libxtst6:i386

RUN mkdir -p /root/freetype
WORKDIR /root/freetype
RUN wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.12.tar.bz2
RUN apt-get build-dep -y -a i386 libfreetype6
RUN tar -xjvf freetype-2.4.12.tar.bz2
WORKDIR /root/freetype/freetype-2.4.12
RUN ./configure --build=i686-pc-linux-gnu "CFLAGS=-m32" "CXXFLAGS=-m32" "LDFLAGS=-m32"
RUN make -j8
RUN chmod +x /root/modelsim/ModelSimSetup-13.1.0.162.run 
RUN /root/modelsim/ModelSimSetup-13.1.0.162.run --mode unattended --installdir /root/altera
RUN ln -s /root/modelsim_ase/bin /root/.local/bin
RUN echo 'export LD_LIBRARY_PATH=/root/freetype/freetype-2.4.12/objs/.libs' > /root/.local/bin/start_vsim
RUN chmod +x /root/.local/bin/start_vsim

