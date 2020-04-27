
R=./recipes

all: mac-devenv-vnc

generated/devenv-ssh.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile $(R)/base.Dockerfile $(R)/ssh.Dockerfile
	cat $^ > $@

generated/devenv-vnc.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile $(R)/base.Dockerfile $(R)/vnc.Dockerfile $(R)/neovim.Dockerfile ${R}/kitty.Dockerfile ${R}/dotfiles.Dockerfile
	cat $^ > $@

generated/riscenv.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile $(R)/base.Dockerfile $(R)/riscv.Dockerfile $(R)/neovim.Dockerfile
	cat $^ > $@

clean:
	rm -rf generated/*.Dockerfile

build-%: generated/%.Dockerfile
	docker --tlsverify build -f $< -t $*-latest .

build-mac-%: generated/%.Dockerfile
	docker build -f $< -t $*-latest .

mac-devenv-vnc: build-mac-devenv-vnc

