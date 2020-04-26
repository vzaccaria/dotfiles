RUN curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin ; exit 0
RUN git clone --depth 1 https://github.com/harfbuzz/harfbuzz.git /tmp/harfbuzz
WORKDIR /tmp/harfbuzz/ 
RUN ./autogen.sh && ./configure && make
RUN mkdir -p /root/.local/kitty.app/lib
RUN cp src/.libs/libharfbuzz.so ~/.local/kitty.app/lib/libharfbuzz.so.0
