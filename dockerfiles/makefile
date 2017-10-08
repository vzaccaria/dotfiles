
R=./recipes
G=./generated

all: \
	$(G)/devenv.Dockerfile \
	$(G)/devenv-gui.Dockerfile \
	$(G)/modelsim.Dockerfile \
	$(G)/luxrender.Dockerfile \
	$(G)/maxima.Dockerfile

$(G)/reflex-ghcjs-dev.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/haskell.Dockerfile \
			$(R)/reflex-ghcjs.Dockerfile 
	cat $^ > $@

$(G)/ghcjs-dev.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/haskell.Dockerfile \
			$(R)/ghcjs.Dockerfile 
	cat $^ > $@

$(G)/devenv.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/haskell.Dockerfile 
	cat $^ > $@

$(G)/devenv-gui.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/haskell.Dockerfile \
		  $(R)/vnc.Dockerfile
	cat $^ > $@

$(G)/anki-gui.Dockerfile: $(G)/devenv-gui.Dockerfile \
		  $(R)/anki.Dockerfile
	cat $^ > $@

$(G)/modelsim.Dockerfile: 	$(R)/from.ubuntu14.04.Dockerfile \
				$(R)/vhdl.Dockerfile
	cat $^ > $@

$(G)/luxrender.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/luxrender.Dockerfile
	cat $^ > $@

$(G)/maxima.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/maxima.Dockerfile
	cat $^ > $@

build-%: $(G)/%.Dockerfile
	docker --tlsverify build -f $< -t $*-latest .

reflex-ghcjs-build: build-reflex-ghcjs-dev
ghcjs-dev-build: build-ghcjs-dev

# push-devenv-%:
# 	docker --tlsverify tag devenv-latest vzaccaria/devenv:$*
# 	docker --tlsverify push vzaccaria/devenv
