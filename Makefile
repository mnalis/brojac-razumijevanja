USER=$(shell find . -maxdepth 1 -name brojac-razumijevanja.html  -printf %u)

nothing:
	@echo Doing nothing as user=$(USER)...

update:
	umask 077; if [ "`id -un`" = "$(USER)" ] ; then git pull; else env -i setuidgid $(USER) git pull; fi
	chmod -R a=rX,u=wr *.html *.js *.css *.txt LICENSE README.md
	chmod 700 .git

publish:
	git commit -a || true
	git push
