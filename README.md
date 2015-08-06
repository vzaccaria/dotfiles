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

-     add solarized theme to emacs -- [Aug 6th 15](../../commit/144d93a23a17146445f82f6182efbdfc74d98d48)
-     add pseudo map reduce -- [Aug 2nd 15](../../commit/f653ca8b666075a0e935e127a176dc503762d55d)
-     add yasnippet directories and configuragtion -- [Jul 28th 15](../../commit/2ea5d7a2f20356c4209054bbe4e25a1024de3f28)
-     add export paths to linux -- [Jul 22nd 15](../../commit/d83a286d06e2edcb8d4ddbdabf5df419c9dc2a3e)
-     add beautify orgmode and refactor agenda in multiple org files -- [Jul 16th 15](../../commit/35d81ceff71bb590d582aa05f2015cc2a8907f3d)
-     enable local manpages, for my commands -- [Jul 14th 15](../../commit/6c01627c352ebfa2d950683b4b6c211378769b18)
-     add ack config file -- [Jul 12th 15](../../commit/db7e456ccdbb65d8b596a76744a0890cae40bd8e)
-     use toilet instead of figlet in emacs -- [Jul 12th 15](../../commit/6f77534154375f354bb2c8b0a9a0b75ea2144528)
-     add autosave to emacs file -- [Jul 12th 15](../../commit/d637b2d5d9a0cf539e4214fd7e62bc0c2930c26f)
-     add history to readme -- [Jul 12th 15](../../commit/53f041cc3bcc1676b6f074eca8afea8b0244eb07)
-     add pcat and pless -- [Jul 11th 15](../../commit/442d22bd8a70f435e6e4b359e885b3b3aa659cfe)
-     add zprezto -- [Jul 11th 15](../../commit/77ba7e9ed5636e87a7c286f0b8b5f0e0ba2ea156)
-     add emacs, figlet and gitfiles -- [Jul 11th 15](../../commit/b10a85b5608018eed586765bce177de937876749)

# Bug fixes

-     look locally for manuals -- [Jul 16th 15](../../commit/6c3b51490b5cd0c567776f597d7a54210d09d38a)
-     remove zsh folder -- [Jul 12th 15](../../commit/c6679587d390df6e65668fcc4fc5f6a11232e93b), [Jul 12th 15](../../commit/f5cadde3eac0c667b2f3984f01229874909806b1)
-     remove linux specific parts from darwin code -- [Jul 12th 15](../../commit/5d953bd458b7263892d4ad2c86c27a3f3bd4ce37)
-     add zprezto as a submodule -- [Jul 12th 15](../../commit/66c129c9cd39f658d4610f5e8acd32c5b6f14fa7)
