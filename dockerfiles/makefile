
R=./recipes
G=./generated

$(G)/devenv.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile \
			$(R)/base.Dockerfile \
			$(R)/haskell.Dockerfile 
	cat $^ > $@

$(G)/modelsim.Dockerfile: 	$(R)/from.ubuntu14.04.Dockerfile \
				$(R)/vhdl.Dockerfile
	cat $^ > $@

build-%: %.Dockerfile
	docker --tlsverify build -f $< -t $*-latest .

# push-devenv-%:
# 	docker --tlsverify tag devenv-latest vzaccaria/devenv:$*
# 	docker --tlsverify push vzaccaria/devenv
