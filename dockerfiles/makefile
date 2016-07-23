

devenv.Dockerfile: ./base.ubuntu16.04.Dockerfile haskell-clash.ubuntu14.04.Dockerfile devenv-finish.Dockerfile
	cat $^ > $@

build-devenv: devenv.Dockerfile
	docker --tlsverify build -f $< -t devenv-latest .

push-devenv-%:
	docker --tlsverify tag devenv-latest vzaccaria/devenv:$*
	docker --tlsverify push vzaccaria/devenv
