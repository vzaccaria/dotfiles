
R=./recipes
G=./generated

all: mac-devenv-vnc

$(G)/devenv.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile $(R)/base.Dockerfile 
	cat $^ > $@

$(G)/devenv-ssh.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile $(R)/base.Dockerfile $(R)/ssh.Dockerfile
	cat $^ > $@

$(G)/devenv-vnc.Dockerfile: $(R)/from.ubuntu16.04.Dockerfile $(R)/base.Dockerfile $(R)/vnc.Dockerfile
	cat $^ > $@

clean:
	rm -rf $(G)/*.Dockerfile

build-%: $(G)/%.Dockerfile
	docker --tlsverify build -f $< -t $*-latest .

build-mac-%: $(G)/%.Dockerfile
	docker build -f $< -t $*-latest .

mac-devenv-vnc: build-mac-devenv-vnc

