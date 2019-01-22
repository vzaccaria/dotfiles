# Managing

I manage dotfiles with [gnu stow](http://www.gnu.org/software/stow/), a free,
portable, lightweight symlink farm manager.

# Installing

stow is available for all linux and most other unix like distributions via your
package manager.

- `sudo pacman -S stow`
- `sudo apt-get install stow`
- `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and
[build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL) yourself.

# Specific help (install additional tools)

## Zprezto

### Description

- files `zprezto/.*` correspond to my actual `zprezto` configuration files.
  They've been copied when I was creating my dotfiles repo.
- directory `zprezto/.zprezto` is an actual git submodule directly from the
  github repo of the author.

### How to set it up

- Basically, the .zprezto submodule should be updated separately with

<!-- -->

```shell
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

---

# New features

-     add awesome-vimrc -- [Feb 4th 17](../../commit/42269cdb5352747aef679aac7cd78e506066b005)
-     add common headers for org to pdf exports -- [Nov 21st 16](../../commit/67f71ee02966aaa3172d1c01fc9e7258a1b5c075)
-     add mu4e -- [Sep 15th 16](../../commit/97ad1426543e1a05d7c565770f100cb9f3ceadfa)
-     add modelsim -- [Jul 29th 16](../../commit/a343fc2a7e909778c58a0202d10493a3bb639359)
-     change dockerfiles to install a stripped down version of spacemacs -- [Jul 23rd 16](../../commit/d248bbdaa31fb8860fe199659426a49ccdf8c896)
-     add new spacemacs config -- [Jul 23rd 16](../../commit/acd95b5a7ac830b74a0dee0b9c74f39e1d476c02)
-     add stack local path to be used in containers -- [Jul 22nd 16](../../commit/eb957642117ebd0867145faa0ca814746019f1bf)
-     add spacemacs docker runner -- [Jul 22nd 16](../../commit/34816eae04deecd08ceacd89a1f0f23ce2fea321)
-     change configuration for qnappino -- [Jul 22nd 16](../../commit/6e3a922be67ea687ec77d214d21f42f3d625975d)
-     add zed.sh -- [Jul 19th 16](../../commit/24069d8fbcd24c3be2c4acc0b8b98cee9a023eaa)
-     add stack-work to ignored files -- [Jul 7th 16](../../commit/3c5e774084a7b135fca6178929bb408efc6d8852)
-     improve zsh integration -- [Jul 7th 16](../../commit/cfb4decb72def1ff030cbefce9140e328c1e1d1d)
-     add git to spacemacs and git-chdir-into-root -- [Jul 5th 16](../../commit/33fb9a6a87fcf9cef3ddd1d386d6b6ac1d2ebc29)
-     extend ignore file with new extensions -- [Jul 5th 16](../../commit/aa4824a3b92c7da4d5e200054a81b2a0d3bc8d51)
-     open url with command-right-click -- [Jun 27th 16](../../commit/8c92e05f054410b720327482e431fbaf039d2084)
-     change aliases -- [Jun 27th 16](../../commit/fa285a31910892cbec156817324cb1420fd39e1f)
-     add private files -- [Jun 27th 16](../../commit/558b19e1921b3508e8ca5332c4fa64c6335e9232)
-     add docs -- [Jun 24th 16](../../commit/a651be37354cbc0fe187a47ac9559b3cb55478fb)
-     add docker layer to spacemacs -- [Jun 19th 16](../../commit/e5166664478d15b455e273fe8789ece6271c98f6)
-     add some more aliases -- [Jun 19th 16](../../commit/fc1329ea23394633da2d551f82cb12c2d0cac74c)
-     add prodigy conf -- [May 22nd 16](../../commit/770b0d3a313a92cd510f9a759c1d8df5a579c58a)
-     add new qnap commands -- [May 1st 16](../../commit/fa75c02a122232e315496052ea7c128360b6e904)
-     add org capture -- [Apr 28th 16](../../commit/e3d4c663af5f81b20bcf428d6a7cfc0e64c92e21)
-     add symbolic link -- [Apr 18th 16](../../commit/2877fe48394e8dba82e64bbace6bebb8d84611d9)
-     add private layer -- [Apr 18th 16](../../commit/f40f1dca793961759914fcdf18d5cbb45110128a)
-     initial spacemacs configuration -- [Apr 17th 16](../../commit/e8402e196dd5245786f46c811f7098a93a6f060c)
-     add spacemacs configuration -- [Apr 17th 16](../../commit/736d93bf5309d855649348f087a1476287e376cb)
-     add make for docs -- [Apr 6th 16](../../commit/b39680d295ddc7d1267d5038644f544ead7a2898)
-     add a few sessions -- [Apr 6th 16](../../commit/f12efd090ccd47857daf08c3842c6cba43f42f78)
-     beautify json and add default column value -- [Apr 6th 16](../../commit/5d0683ebfcbc69ca34c4946034cfda854e981925)
-     add a good bunch of brew packages to install -- [Apr 5th 16](../../commit/d00abae6561ef8e1482a424c184a6fa42161dedf)
-     add a few alias and fix remote docker integration -- [Apr 5th 16](../../commit/4786be3e25b792d9f6f85b13d91bd9325d4728ca)
-     add haskell-clash dockerfiles -- [Mar 10th 16](../../commit/d652e62bdd6ed711407f7b0105f54954ce0a2246)
-     add haskell ansible roles -- [Mar 10th 16](../../commit/f075eed2310240bb4602d21d176f48af5e139c58)
-     functions.sh -- [Mar 8th 16](../../commit/18dc8ebf0ffe28813e42442ef916a4952afe8a6a)
-     add boilerplate for modules -- [Feb 7th 16](../../commit/4c3ac640e3e6c2a9c38bd766d5738a070aef4d78)
-     add idris mode -- [Feb 6th 16](../../commit/ed8d9f2c44c31d80c7586e631272a94bbbd7e859)
-     add language helper functions -- [Feb 6th 16](../../commit/13032d70f7180a143da42a488dc4698f09b8cd4e)
-     add build rules -- [Feb 6th 16](../../commit/d75261f62685226972f9b18b889e8195931c121a)
-     save config -- [Feb 3rd 16](../../commit/f4c3b9031f220f89086eb14a7c848866bce2193e)
-     add node docker file -- [Feb 3rd 16](../../commit/7af393871833940b17dc1ed7446f9966995f8ce3)
-     add spell checking related functions -- [Feb 3rd 16](../../commit/a0443fbe6824fc5accd04f3fe922af227bd5e03b)
-     add .bin folder to path -- [Jan 30th 16](../../commit/a4f53cca2eebf6859d9925d7e008ffcc30f05c6f)
-     add backup script -- [Jan 30th 16](../../commit/19e583d844b5e2736066c90f00d5cf645373fee8)
-     add binaries and make stowable dirs -- [Jan 30th 16](../../commit/b45292c403d9b57e45abae6ebcc0bedd41992876)
-     add mathematica and fix some haskell things, probably -- [Jan 30th 16](../../commit/35a1e25d3fc140e322a432448974ebf98d709f50)
-     add a stripped down version of emacs configuration for remote linux VPS -- [Jan 17th 16](../../commit/89d0d80a59f399f1b3de2670b002ad4e2014980f)
-     add a few useful aliases for linux shell -- [Jan 17th 16](../../commit/ac189c1ee9a38e4cb959516e9f2f2b55c3d2fdf7)
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

-     treat consistently arguments to lift,map,fe,fex -- [Dec 11th 16](../../commit/2f9587d838c52b8b2213b38cd94c26fa63a20ab7)
-     improve search based on ag -- [Dec 7th 16](../../commit/09e68db1f554243b1489548f1c902e1611934c17)
-     use luatex, fix tex configuration, fix mail configuration and keymaps -- [Nov 5th 16](../../commit/6d310e84386a87af77dbca5cb1f638df41dc520c)
-     improve mail support -- [Sep 29th 16](../../commit/e6fd15774f1b25985529d7b31da500f07d36a732)
-     use paths relative to the root -- [Sep 15th 16](../../commit/ee73fff7eecde778565f06fa431b14cc580df8f5)
-     update spacemacs command -- [Aug 26th 16](../../commit/2620073c4b6b47b4f16634cdad6fff5fd3b26ab5)
-     compact dockerfiles -- [Aug 26th 16](../../commit/2f34b18de294ae515b3a46a5193c5a35f084a70f)
-     move gmake alias into darwin section -- [Jul 26th 16](../../commit/220333a938ad7c3d0bee9521fbe1caeb39d6e1e5)
-     add stack local bin dir -- [Jul 22nd 16](../../commit/2a57ad6d720cf3b43dcf524aa979ac4d8e5a42ba)
-     change emacs path for linux hosts -- [Jul 21st 16](../../commit/816702c04c925e32ed35d97dbd70536d9f4027ab)
-     initialization of org export -- [Jul 21st 16](../../commit/dc8b968613c64d7eb37fec405a1545a01520c4dd)
-     move initialization of org latex classes after ox-latex has been loaded -- [Jul 21st 16](../../commit/3689c8df83b8b7dc6eeac9cc9182fd490256ca77)
-     remove unneeded spacemacs files -- [Jul 21st 16](../../commit/944330d7ae56fdc7b65ddb7d0f854afbd6b4a6f7)
-     change fonts for ascii diagrams and use helm-buffer for buffers -- [Jul 19th 16](../../commit/ca8930eadeddbdd9a1db448a2ee22df3661cbd0a)
-     remove missing files -- [Jun 29th 16](../../commit/3b646277e3fa2883caec73a13dc27a6278963114)
-     add missing parameter -- [Jun 29th 16](../../commit/f4694d98b2cc3cf3a74a9e5df1ce81a0eacc0881)
-     fix emacs paths -- [Jun 29th 16](../../commit/89049c9dab9ae181388f36dec923d2e12a46f102)
-     fonts -- [Jun 24th 16](../../commit/0937677cac012717dc32a92e1dd181c4dedd901b)
-     update spacemacs and qnap utils -- [Jun 18th 16](../../commit/cd435638b8cbf56329770186b73f69e040f58e78)
-     add smaller tmux conf -- [Jun 18th 16](../../commit/9a620ae88dc976b1909b10e6d5c21ca72c004586)
-     configure xelatex -- [May 31st 16](../../commit/189579c6a7013085457da1ee6fb9baea43805811)
-     node path -- [Apr 28th 16](../../commit/893fdba002d4768e5787b11ea3969a2637caceca)
-     add a few session types -- [Apr 27th 16](../../commit/7c1276983a9be9ce98431ff04cb35208a86c30f4)
-     latex configuration -- [Apr 27th 16](../../commit/8ef6dae6627b8ce4bb041467724f1b750ddf9788)
-     meta key for iterm -- [Apr 18th 16](../../commit/0e01018815eb4503638d4382add6b71d4faf2d4e)
-     use private layer for my own stuff -- [Apr 18th 16](../../commit/a3ea29cc99e66b8b558fb9f47aed98bbed2925c8)
-     before trying spacemacs -- [Apr 16th 16](../../commit/b2d579cee630e01a5aedd70e2a073e169e7df992)
-     update help -- [Apr 6th 16](../../commit/f463e0bdaa478cdc11ff1b33ffc99e86e6240b29)
-     assign more meaningful name -- [Apr 5th 16](../../commit/7010dbfd623e369c83bfca618a2d8810c00e41d8)
-     use make -I for running make now -- [Apr 5th 16](../../commit/ee3f112d1675b6eea2fad035b52c273bdd61b298)
-     change themes and try another pomodoro package -- [Apr 5th 16](../../commit/8738e9836d6120ce270926aa64666978826d3aa4)
-     remove missing themes -- [Mar 3rd 16](../../commit/d22064acd87a0d8f0cc30dfb7d9d0d4a40ae9202)
-     update emacs files -- [Mar 3rd 16](../../commit/db54656d303054569edbec620fe471d8477db1b8)
-     update global makefile -- [Feb 3rd 16](../../commit/fff36f9bf155503f98ba281151330e05a0b97fcf)
-     change directories -- [Feb 3rd 16](../../commit/787da6c164e4a67005c8a416544f24c19d61a39b)
-     haskell and helm modes -- [Feb 2nd 16](../../commit/6b6bdfe176e45517b65c5b54c5215c994193c1b9)
-     improve haskell linting and reformat options -- [Jan 31st 16](../../commit/92f3db23a36f07f3d97dadb4d301368e8ba466a8)
-     use emacs as default editor for git -- [Jan 30th 16](../../commit/6ca73bd53e9e7ee72368cfdac5a09253dce1bd9e)
-     improve docker integration when connecting to host machines -- [Jan 30th 16](../../commit/a73ed31b1ba00281588f550a2a74a2e2a8f586e4)
-     forgot to split commands -- [Jan 17th 16](../../commit/2e090c30a7746d603e8bda9985304e78d73d613e)
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
