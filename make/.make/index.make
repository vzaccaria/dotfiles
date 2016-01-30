BUILDIR ?= build
.DEFAULT_GOAL := all

EXEMD_TARGETS = $(patsubst %.md, $(BUILDIR)/%.md, $(notdir $(EXEMD_SRC)))

$(BUILDIR)/%.md: %.md
	@exemd $< -p > $@

$(BUILDIR):
	mkdir -p $(BUILDIR)

clean:
	rm -rf $(BUILDIR)
