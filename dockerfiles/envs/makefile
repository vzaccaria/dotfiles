CMD=docker run -dt -p 5901:5901 -e PATH=/root/.local/bin:/opt/bin:/opt/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/bin/X11:/usr/local/sbin:/usr/local/bin --privileged devenv-vnc-latest

b: build-devenv-vnc

r: 
	$(eval $IMG:= $(shell $CMD))
	docker exec -d "$IMG" /root/startx
	echo "Click here: vnc://127.0.0.1:5901"

build-%: %.Dockerfile
	docker build -f $< -t $*-latest .

build-mac-%: %.Dockerfile
	docker build -f $< -t $*-latest .


