GIT=/usr/bin/git
START=/usr/bin/firefox -new-tab

main: deploy
	@$(START) index.html

# Commit using git
push-to-branch:
	-$(GIT) commit -a

# Push to github with tags
deploy: push-to-branch
	$(GIT) push main
	$(GIT) push --tags main
	
# Test by visiting https://wilfridskendall.github.io/index.html
see: 
	$(START) https://wilfridskendall.github.io/index.html

