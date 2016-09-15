WATCHOBJECT=$(DOCOBJECT)
WATCHTARGET=$(DOCTARGET)

include $(MAKEROOT)/index.make

livedit:
	open -a "Skim" $(DOCTARGET)
	make watch
