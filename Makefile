PULP=npx pulp
PSC=npx psc-package

.PHONY: run
run:
	$(PULP) --psc-package run

configure:
	npm i
  $(PSC) install
