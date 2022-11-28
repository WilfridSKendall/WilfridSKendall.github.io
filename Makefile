GIT=/usr/bin/git

push-to-branch:
	$(GIT) commit -a
	$(GIT) push
	$(GIT) push --tags

deploy:
	$(GIT) push main
	
# Test by visiting https://wilfridskendall.github.io/index.html
