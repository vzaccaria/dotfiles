RUN wget -q -O- https://s3.amazonaws.com/download.fpcomplete.com/ubuntu/fpco.key | apt-key add -
RUN echo 'deb http://download.fpcomplete.com/ubuntu trusty main' | tee /etc/apt/sources.list.d/fpco.list
RUN apt-get update && apt-get install stack -y
RUN stack setup --resolver lts-3.6
RUN apt-get install -y libtinfo-dev
RUN apt-get install -y libncurses5-dev
RUN stack install clash-ghc --resolver lts-3.6
RUN stack install clash-prelude --resolver lts-3.6
RUN stack install tasty tasty-hunit tasty-quickcheck --resolver lts-3.6
