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

-     initial integration with auctex -- [Jan 16th 16](../../commit/5273893beee09b69eaa5044fd28d336d5863e15c)
-     add Slate window manager config -- [Oct 3rd 15](../../commit/8330a1959f0c18d91b90cb15dcb5d85e1bf9f4b4)
-     add magit shortcuts -- [Oct 3rd 15](../../commit/f16ac0ca8c850f44f16a6348d364dbb83d97404f), [Oct 3rd 15](../../commit/2d1bcbba718653485807ddae23ce59bd4f10b1d5)
-     add R integration -- [Oct 3rd 15](../../commit/27e038c5b741c394d739276e351222130a7f87cf)
-     add osx configuration commands -- [Sep 30th 15](../../commit/7913696c216aa77df55c9b09f7cae3bb7416c668)
-     add a few new packages and tweaks -- [Sep 20th 15](../../commit/dbddef6ce226aecec0fd30dd2907cdc6fd870243)
-     new helpers for python virtual envs and git -- [Sep 20th 15](../../commit/093f1f5c4f9445af2734c6c04b33d834e0208295)
-     new snippets for org-mode and js-mode -- [Sep 20th 15](../../commit/9237ab6e550fab63b38886b6914ec74cc7b01e1e)
-     extend git toolbelt -- [Sep 15th 15](../../commit/8d5250ba6d6a4f7a619bdffbd54793cf5db10d52)
-     extend snippet base -- [Sep 15th 15](../../commit/e002943851b929fbd13b4ae52223d45ebf47f53f)
-     add capture templates -- [Sep 11th 15](../../commit/22f9d44d354932c067f26e8a6a59143c9ae0c3f4)
-     add dired -- [Sep 7th 15](../../commit/ce6119ee699e05aa2e699d84e5b29874b68a021d)
-     refactor .emacs -- [Sep 7th 15](../../commit/ba39bcd84fe29ebd7d5b3deef970806e2a437918)
-     add realpath and other git aliases -- [Sep 7th 15](../../commit/830047ae493848bd4682a7a43cd49a9f9e99335e)
-     add json stringify snippet -- [Sep 7th 15](../../commit/639dd9c36563b0c9cbd91c4a67699878ed59d767)
-     add some common foo names -- [Sep 7th 15](../../commit/fca8eae0a7ddeb595022613a0ba295182f7f4129)
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

-     enable latex mode map only in auctex mode -- [Jan 9th 16](../../commit/78d65e1058e84465197858c5b66ab6239a9d9ddc)
-     use web-mode for js[x] files -- [Oct 3rd 15](../../commit/1a9bc59c5148c2b526d13e1b877a9e40058a98a9)
-     open new windows vertically (hopefully) -- [Oct 3rd 15](../../commit/e9df240e688804cf12c043519f691f1b650301eb)
-     an alias was messing up with hub -- [Oct 1st 15](../../commit/40f3a9ffa79af320dbdedf45a622f3fd8cf742b4)
-     export was not using accented characters and arrows -- [Sep 24th 15](../../commit/6d3177ae6de9abd2cf471aa426fcf974c4b59977)
-     correct path to theme module -- [Sep 8th 15](../../commit/912c8de2a02b5fe91381c382e333600a35353a24)
-     change search hotkey -- [Sep 7th 15](../../commit/cbfca7dfb5c529f2b48f04380bf4dda2bb7a04a7)
-     look locally for manuals -- [Jul 16th 15](../../commit/6c3b51490b5cd0c567776f597d7a54210d09d38a)
-     remove zsh folder -- [Jul 12th 15](../../commit/c6679587d390df6e65668fcc4fc5f6a11232e93b), [Jul 12th 15](../../commit/f5cadde3eac0c667b2f3984f01229874909806b1)
-     remove linux specific parts from darwin code -- [Jul 12th 15](../../commit/5d953bd458b7263892d4ad2c86c27a3f3bd4ce37)
-     add zprezto as a submodule -- [Jul 12th 15](../../commit/66c129c9cd39f658d4610f5e8acd32c5b6f14fa7)
