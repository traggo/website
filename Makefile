DEV_PORT=8000

watch-docs:
	docker run --rm -it -p ${DEV_PORT}:8000 -v $$PWD:/docs squidfunk/mkdocs-material:4.6.3

docs:
	docker run --rm -it -v $$PWD:/docs squidfunk/mkdocs-material:4.6.3 build

.PHONY: docs watch-docs
