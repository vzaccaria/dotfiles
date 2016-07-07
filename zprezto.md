What is it in zprezto?
======================

-   files `zprezto/.*` correspond to my actual `zprezto` configuration
    files. They've been copied when I was creating my dotfiles repo.
-   directory `zprezto/.zprezto` is an actual git submodule directly
from the github repo of the author.

# How to setup zprezto

- Basically, the .zprezto submodule should be updated separately with

> cd zprezto
> git submodule update --init    # Update zprezto
> cd .zprezto
> git submodule update --init    # Update externals


# How about updating all the modules?

cd  $HOME/.zprezto && git pull && git submodule update --init --recursive
