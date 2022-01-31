# Makefile

.PHONY: scrape
scrape:
	scripts/scrape_lab1.sh

.PHONY: save
save:
	scripts/save_lab1.sh lab1

.PHONY: push
push: scrape
	scripts/push.sh lab1

