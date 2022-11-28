GIT=/usr/bin/git

deploy:
	$(GIT) commit -a
	$(GIT) push
	$(GIT) push --tags
