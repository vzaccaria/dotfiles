RUN git clone https://github.com/vzaccaria/ghcjs-template.git /root/starterApp
WORKDIR /root/starterApp
RUN stack build gtk2hs-buildtools --stack-yaml=stack-prebuild.yaml --install-ghc
RUN stack build --install-ghc

