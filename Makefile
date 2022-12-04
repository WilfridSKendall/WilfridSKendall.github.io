GIT=/usr/bin/git
SED=/bin/sed
START=/usr/bin/firefox -new-tab

main: deploy
	@$(START) index.html

# Commit using git
push-to-branch: datestamp
	-$(GIT) commit -a
	$(GIT) push --tags
	$(GIT) push

# Push to github with tags
deploy: push-to-branch
	$(GIT) checkout main
	$(GIT) pull
	$(GIT) merge working
	$(GIT) push
	$(GIT) checkout working

# Datestamp `index.html`
datestamp:
	-$(SED) -i -e"/^This web-page/s/updated.*$$/updated $(shell date -Idate)/" index.html

# Test by visiting https://wilfridskendall.github.io/index.html
see: 
	$(START) https://wilfridskendall.github.io/index.html

