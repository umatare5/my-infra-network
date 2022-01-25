# Makefile

.PHONY: scrape
scrape:
	scripts/scrape_lab1.sh

.PHONY: push
push: scrape
	scripts/push.sh lab1
