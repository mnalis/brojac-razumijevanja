USER=$(shell find . -maxdepth 1 -name brojac-razumijevanja.html -or -name LICENSE  -printf %u)
DST=brojac-razumijevanja.html
SVGS=svg/1f603.svg svg/1f610.svg svg/1f62d.svg

build: $(DST)
	@echo Finishing as user=$(USER)...

update-svg: $(SVGS)
	wget -q https://github.com/googlefonts/noto-emoji/raw/master/svg/LICENSE -O svg/LICENSE
	@echo fonts downloaded

$(DST): src/* merge_html.pl Makefile $(SVGS)
	cd src && ../merge_html.pl < brojac-razumijevanja.src.html > ../$(DST)

update:
	chmod 700 .git
	chown -R ($USER): .git
	umask 077; if [ "`id -un`" = "$(USER)" ] ; then git pull; else env -i setuidgid $(USER) git pull; fi
	chmod -R a=rX,u=wr *.html *.txt *.md LICENSE

clean:
	rm -f *~ src/*~ $(DST)

distclean: clean
	rm -f svg/*.svg svg/LICENSE

svg/%.svg:
	wget -q https://github.com/googlefonts/noto-emoji/raw/master/svg/emoji_u$*.svg -O svg/$*.svg

publish: build
	git commit -a || true
	git push --all


.PHONY: build update update-svg publish clean distclean
