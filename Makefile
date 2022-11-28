GIT=/usr/bin/git

deploy:
	$(GIT) commit -a
	$(GIT) push
	$(GIT) push --tags

# Test by visiting https://wilfridskendall.github.io/index.html
