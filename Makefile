GIT=/usr/bin/git
START=/usr/bin/xdg-open

main: see

push-to-branch:
	$(GIT) commit -a
	$(GIT) push
	$(GIT) push --tags

deploy: push-to-branch
	$(GIT) push WilfridSKendall main
	
see: deploy
	$(START) index.html

# Test by visiting https://wilfridskendall.github.io/index.html
