RUN git clone https://github.com/vzaccaria/ghcjs-template.git /root/starterApp
WORKDIR /root/starterApp
RUN stack setup
RUN stack build gtk2hs-buildtools 
ENV PATH=/root/.stack/programs/x86_64-linux/ghc-8.0.1/bin:/root/.local/bin:$PATH
RUN stack install alex happy hscolour
RUN stack --no-terminal build --stack-yaml=stack-ghcjs.yaml --install-ghc
RUN mv stack.yaml stack-prebuild.yaml && mv stack-ghcjs.yaml stack.yaml

