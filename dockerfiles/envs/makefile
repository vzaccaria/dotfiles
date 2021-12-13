CMD=docker run -dt  --privileged devenv-vnc-latest

b: build-devenv-vnc

r: 
	$(eval $IMG:= $(shell $CMD))
	docker exec -d "$IMG" /root/startx
c: 
	docker run -ti -p 5900:5900 --privileged devenv-vnc-latest

build-%: %.Dockerfile
	docker build -f $< -t $*-latest .

build-mac-%: %.Dockerfile
	docker build -f $< -t $*-latest .


