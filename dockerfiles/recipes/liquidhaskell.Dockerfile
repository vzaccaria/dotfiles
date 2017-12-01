
RUN git clone --recursive https://github.com/ucsd-progsys/liquidhaskell.git

WORKDIR /root/liquidhaskell
RUN stack install --install-ghc
RUN stack test liquidhaskell --no-run-tests
RUN stack install
ENV PATH /root/.local/bin:$PATH
WORKDIR /root
RUN apt-get install -y z3
RUN stack install hlint
RUN wget https://raw.githubusercontent.com/ndmitchell/hlint/master/.hlint.yaml --no-check-certificate






