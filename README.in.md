# Managing

I manage dotfiles with [gnu stow](http://www.gnu.org/software/stow/), a
free, portable, lightweight symlink farm manager.

# Installing

stow is available for all linux and most other unix like distributions
via your package manager.

-   `sudo pacman -S stow`
-   `sudo apt-get install stow`
-   `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and
[build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL)
yourself.

# Specific help (install additional tools)

## Zprezto

### Description

-   files `zprezto/.*` correspond to my actual `zprezto`
    configuration files. They've been copied when I was creating my
    dotfiles repo.
-   directory `zprezto/.zprezto` is an actual git submodule directly
    from the github repo of the author.

### How to set it up

-   Basically, the .zprezto submodule should be updated separately with

<!-- -->

``` shell
cd zprezto  && git submodule update --init # Update zprezto 
cd .zprezto && git submodule update --init # Update externals
```

### How about updating all the modules?

    cd $HOME/.zprezto && git pull && git submodule update --init --recursive

## Vim

WARNING: temporary: 

For `vim`, I am using the following vimrc:

    git clone https://github.com/amix/vimrc.git ~/.vim_runtime
    stow awesome-vimrc

------------------------------------------------------------------------
