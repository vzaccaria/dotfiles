

devenv.Dockerfile: ./base.ubuntu14.04.Dockerfile haskell-clash.ubuntu14.04.Dockerfile devenv-finish.Dockerfile
	cat $^ > $@

modelsim.Dockerfile: ./base.ubuntu14.04.Dockerfile vhdl-modelsim.ubuntu14.04.Dockerfile
	cat $^ > $@

build-modelsim: modelsim.Dockerfile
	docker --tlsverify build -f $< -t modelsim-latest .

build-devenv: devenv.Dockerfile
	docker --tlsverify build -f $< -t devenv-latest .

push-devenv-%:
	docker --tlsverify tag devenv-latest vzaccaria/devenv:$*
	docker --tlsverify push vzaccaria/devenv
