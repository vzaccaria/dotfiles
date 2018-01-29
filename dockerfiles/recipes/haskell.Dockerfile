RUN curl -L https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-linux-x86_64-static.tar.gz | \
    tar xz --wildcards --strip-components=1 -C /usr/local/bin '*/stack'
RUN apt-get -y install libgmp-dev
RUN stack --resolver=lts-10.0 --install-ghc setup
RUN stack install hlint
RUN wget https://raw.githubusercontent.com/ndmitchell/hlint/master/.hlint.yaml --no-check-certificate
