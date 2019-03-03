PULP=npx pulp
PSC=npx psc-package
PPSC=$(PULP) --psc-package

.PHONY: run
run:
	$(PPSC) run

.PHONY: configure
configure:
	npm i

.PHONY: basic_example
basic_example: ./src/Twimg/Examples/Basic/dist/basic.js

./src/Twimg/Examples/Basic/dist/basic.js:P
	$(PPSC) build --main Twimg.Examples.Basic.Main --to src/Twimg/Examples/Basic/dist/basic.js
	open src/Twimg/Examples/Basic/dist/index.html
