USER=$(shell find . -maxdepth 1 -name brojac-razumijevanja.html  -printf %u)

build: brojac-razumijevanja.html
	@echo Finishing as user=$(USER)...

brojac-razumijevanja.html: src/*
	cd src && ../merge_html.pl < brojac-razumijevanja.src.html > ../brojac-razumijevanja.html

update:
	umask 077; if [ "`id -un`" = "$(USER)" ] ; then git pull; else env -i setuidgid $(USER) git pull; fi
	chmod -R a=rX,u=wr *.html *.js *.css *.txt LICENSE README.md
	chmod 700 .git

clean:
	rm -f *~ src/*~ brojac-razumijevanja.html

publish: build
	git commit -a || true
	git push


.PHONY: build update publish
