
# Utils
sudo apt-get install silversearcher-ag
sudo apt-get install aspell-it
sudo apt-get install pandoc

# Nodejs
sudo apt-get purge nodejs && sudo apt-get autoremove && sudo apt-get autoclean
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install 6.9.5
nvm use 6.9.5
nvm alias default 6.9.5

# Powerline Fonts
git clone https://github.com/powerline/fonts.git
# cd fonts && ./install.sh

# Tex/Latex with Texlive
sudo add-apt-repository ppa:jonathonf/texlive

sudo apt-get install texlive-full
# sudo apt-get install texlive-luatex
# sudo apt-get install perl-tk
# sudo apt-get install xzdec

tlmgr init-usertree
tlmgr gui # --> then install packages
