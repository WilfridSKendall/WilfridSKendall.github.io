GIT=/usr/bin/git
START=/usr/bin/firefox -new-tab

main: deploy
	@$(START) index.html

# Commit using git
push-to-branch:
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
	
# Test by visiting https://wilfridskendall.github.io/index.html
see: 
	$(START) https://wilfridskendall.github.io/index.html

