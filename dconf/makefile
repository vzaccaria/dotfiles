
current.ini:
	dconf dump / > current.ini

.PHONY: import
import:
	cat current.ini | dconf load /

clean:
	rm -rf current.ini


