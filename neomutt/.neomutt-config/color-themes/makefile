
all: ./mutt-colors-css-test.muttrc

%.muttrc: %.muttrc.orig
	termcss $< > $@

clean:
	rm -f ./mutt-colors-css-test.muttrc		
