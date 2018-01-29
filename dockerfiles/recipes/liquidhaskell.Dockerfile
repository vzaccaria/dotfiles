
RUN apt-get install -y z3
RUN git clone --recursive https://github.com/ucsd-progsys/liquidhaskell.git
WORKDIR /root/liquidhaskell
RUN stack install
RUN stack test liquidhaskell --no-run-tests
