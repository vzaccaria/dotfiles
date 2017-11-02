RUN \
    apt-get update && \
    apt-get install -y \
            python2.7 python2.7-dev python2.7-libs python-numpy \
            python-scipy python-pyside python-configobj python-setuptools python-pip \
            avr-libc gcc-avr
RUN pip install pyusb
RUN pip install pyqtgraph

