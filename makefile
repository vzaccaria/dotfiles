# Makefile autogenerated by Dyi on July 12, 2015
#
# Main target: all
# Sources: 

.DEFAULT_GOAL := all


.PHONY: prepare
prepare:




.PHONY: k-1tav8ssx
k-1tav8ssx:  
	git-hist history.md -k 'feat,fix' 


.PHONY: k-9u2r22cr
k-9u2r22cr:  
	cat README.in.md history.md > README.md


.PHONY: k-dco5h92a
k-dco5h92a:  
	hub cm 'update history and readme'


.PHONY: all
all: 
	make k-1tav8ssx 
	make k-9u2r22cr 
	make k-dco5h92a  


.PHONY: clean
clean:  


.PHONY: update
update: 
	make clean   
	node




