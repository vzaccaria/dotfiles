          ██            ██     ████ ██  ██                
         ░██           ░██    ░██░ ░░  ░██                
         ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
      ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░ 
     ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████ 
    ░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
    ░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████ 
     ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░  

    ack
    emacs
    figlet  (fonts)
    fonts
    fun
    git
    ssh     (to be fixed)
    tmux    (use only config file)
    vim     (to be checked, dont use)
    zprezto
    zsh     (to be fixed)

managing
========

I manage dotfiles with [gnu stow](http://www.gnu.org/software/stow/), a
free, portable, lightweight symlink farm manager.

installing
==========

stow is available for all linux and most other unix like distributions
via your package manager.

-   `sudo pacman -S stow`
-   `sudo apt-get install stow`
-   `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and
[build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL)
yourself.

------------------------------------------------------------------------

# New features

-     add ack config file (Sun Jul 12 16:35:32 2015 +0200) - [view](../../commit/db7e456ccdbb65d8b596a76744a0890cae40bd8e) 
-     use toilet instead of figlet in emacs (Sun Jul 12 16:34:30 2015 +0200) - [view](../../commit/6f77534154375f354bb2c8b0a9a0b75ea2144528) 
-     add autosave to emacs file (Sun Jul 12 16:29:46 2015 +0200) - [view](../../commit/d637b2d5d9a0cf539e4214fd7e62bc0c2930c26f) 
-     add history to readme (Sun Jul 12 16:21:29 2015 +0200) - [view](../../commit/53f041cc3bcc1676b6f074eca8afea8b0244eb07) 
-     add pcat and pless (Sat Jul 11 20:06:31 2015 +0200) - [view](../../commit/442d22bd8a70f435e6e4b359e885b3b3aa659cfe) 
-     add zprezto (Sat Jul 11 18:13:42 2015 +0200) - [view](../../commit/77ba7e9ed5636e87a7c286f0b8b5f0e0ba2ea156) 
-     add emacs, figlet and gitfiles (Sat Jul 11 17:23:16 2015 +0200) - [view](../../commit/b10a85b5608018eed586765bce177de937876749) 

# Bug fixes

-     remove linux specific parts from darwin code (Sun Jul 12 15:52:51 2015 +0200) - [view](../../commit/5d953bd458b7263892d4ad2c86c27a3f3bd4ce37) 
-     add zprezto as a submodule (Sun Jul 12 15:52:37 2015 +0200) - [view](../../commit/66c129c9cd39f658d4610f5e8acd32c5b6f14fa7) 
