CMD=docker run -dt  --privileged devenv-vnc-latest

b: build-devenv-vnc

r: 
	$(eval $IMG:= $(shell $CMD))
	docker exec -d "$IMG" /root/startx
c: 
	docker run -ti -p 5900:5900 --privileged devenv-vnc-latest

vnc-open-local: 
	/Applications/TigerVNC\ Viewer\ 1.12.0.app/Contents/MacOS/TigerVNC\ Viewer -SecurityTypes VncAuth ::5900

# /home/nix/.nix-profile/bin/zsh

build-%: %.Dockerfile
	docker build -f $< -t $*-latest .



