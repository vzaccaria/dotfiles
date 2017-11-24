
RUN git clone --recursive https://github.com/ucsd-progsys/liquidhaskell.git

WORKDIR /root/liquidhaskell
RUN stack install --install-ghc
RUN stack test liquidhaskell --no-run-tests



