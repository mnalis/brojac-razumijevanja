USER=$(shell find . -maxdepth 1 -name brojac-razumijevanja.html  -printf %u)

build: brojac-razumijevanja.html
	@echo Finishing as user=$(USER)...

update-svg: svg/1f603.svg svg/1f610.svg svg/1f62d.svg
	wget -q https://github.com/googlefonts/noto-emoji/raw/master/svg/LICENSE -O svg/LICENSE
	@echo fonts downloaded

brojac-razumijevanja.html: src/* merge_html.pl Makefile
	cd src && ../merge_html.pl < brojac-razumijevanja.src.html > ../brojac-razumijevanja.html

update:
	umask 077; if [ "`id -un`" = "$(USER)" ] ; then git pull; else env -i setuidgid $(USER) git pull; fi
	chmod -R a=rX,u=wr *.html *.txt *.md LICENSE
	chmod 700 .git

clean:
	rm -f *~ src/*~ brojac-razumijevanja.html
	rm -f svg/*.svg

svg/%.svg:
	wget -q https://github.com/googlefonts/noto-emoji/raw/master/svg/emoji_u$*.svg -O svg/$*.svg

publish: build
	git commit -a || true
	git push


.PHONY: build update update-svg publish
