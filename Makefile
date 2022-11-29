GIT=/usr/bin/git
START=/usr/bin/xdg-open

main: see

push-to-branch:
	-$(GIT) commit -a

deploy: push-to-branch
	$(GIT) push
	$(GIT) push --tags
	
see: deploy
	@$(START) index.html

# Test by visiting https://wilfridskendall.github.io/index.html
