PULP=pulp

.PHONY: run
run:
	$(PULP) --psc-package run

configure:
	npm i
