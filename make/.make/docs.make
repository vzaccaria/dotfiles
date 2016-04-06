WATCHOBJECT=$(DOCOBJECT)
WATCHTARGET=$(DOCTARGET)

include index.make

livedit:
	open -a "Skim" $(DOCTARGET)
	make watch
