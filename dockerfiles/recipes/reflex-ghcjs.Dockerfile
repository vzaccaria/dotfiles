ENV U robot
RUN useradd -ms /bin/zsh $U
RUN groupadd nixbld && usermod -a -G nixbld $U
ENV HOME /home/$U
RUN mkdir -p /nix /opt/reflex-platform && chown -R $U /nix /opt/reflex-platform
ENV USER $U
USER $U
WORKDIR /home/$U
RUN curl https://nixos.org/nix/install | sh
RUN git clone https://github.com/russogiuseppe/reflex-platform.git /opt/reflex-platform
WORKDIR /opt/reflex-platform
RUN ./try-reflex

