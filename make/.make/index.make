BUILDIR ?= build


.DEFAULT_GOAL := all

# Used to create a directory as a prerequisite of a file
.SECONDEXPANSION:

mirrorinto = $(patsubst %, $1/%, $2)
collapseinto = $(patsubst %, $1/%, $(notdir $2))

# Used to create a directory as a prerequisite of a file
%/.f:
	mkdir -p $(dir $@)
	touch $@

clean:
	rm -rf $(BUILDIR) $(INTERMEDIATEDIRS)


.phony: show-procs
show-procs:
	@echo 'Controlling the following processes (PROCREGEXP = ${PROCREGEXP}): '
	@echo ' '
	@-pgrep -l -f ${PROCREGEXP}
	@echo ' '

.phony: kill-procs
kill-procs:
	@make show-procs
	@-pkill -9 -f ${PROCREGEXP}
