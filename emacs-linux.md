To use these packages you should install emacs 24.4

```bash
sudo apt-get install build-essential
sudo apt-get build-dep emacs24
wget http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz
tar -xzvf emacs-24.4.tar.gz
rm emacs-24.4.tar.gz
cd emacs-24.4
./configure --prefix=/opt/emacs
make
sudo make install
```
