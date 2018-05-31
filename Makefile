all: release

tag:
	@git tag `grep -m 1 'FROM node:' Dockerfile | cut -d ":" -f2 | cut -d "-" -f1`

release: tag
	@git push && git push --tags

.PHONY: tag release
